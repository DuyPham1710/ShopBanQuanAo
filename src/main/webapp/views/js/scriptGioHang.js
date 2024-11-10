
  /*   function formatCurrency(value) {
        return value.toLocaleString('vi-VN'); // 'vi-VN' sẽ sử dụng dấu chấm cho hàng nghìn theo chuẩn Việt Nam
    } */
	
document.getElementById("selectAll").addEventListener("change", function () {
    const checkboxes = document.querySelectorAll(".cart-item input[type='checkbox']");
    checkboxes.forEach(function (checkbox) {
        checkbox.checked = this.checked;
    });
});	
document.querySelector("form[action='./ThanhToanController']").addEventListener("submit", function (e) {
    const selectedItems = document.querySelectorAll(".cart-item input[type='checkbox']:checked");
    
    if (selectedItems.length === 0) {
        e.preventDefault(); // Ngừng gửi form
        $('#emptyCartModal').modal('show'); // Hiển thị modal thông báo
    }
});
function changeQuantity(value, maSP, maKichThuoc, maMau, soLuongSP, giaHienTai, giaBanDau) {
    // Lấy phần tử hiển thị số lượng và giá trị ẩn của sản phẩm tương ứng
    const quantityElement = document.getElementById("quantity-" + maSP + "-" + maKichThuoc + "-" + maMau);
    const hiddenQuantity = document.getElementById("hiddenQuantity-" + maSP + "-" + maKichThuoc + "-" + maMau);
    
    // Chuyển đổi số lượng thành số nguyên
    let quantity = parseInt(quantityElement.innerText);
    
    // Tăng hoặc giảm số lượng
    quantity += value;
    
    // Đảm bảo số lượng không nhỏ hơn 1
    if (quantity < 1) {
        quantity = 1;
    }
    
    if (quantity > soLuongSP) {
        // Hiển thị toast khi số lượng vượt quá tồn kho
       	showErrorToast();
        quantity = soLuongSP; // Đặt lại số lượng về giá trị tối đa
    }
    // Cập nhật lại giá trị số lượng trên trang và giá trị ẩn
    quantityElement.innerText = quantity;
    hiddenQuantity.value = quantity;
    
 // Cập nhật lại giá tiền hiện tại và giá ban đầu
    const currentPriceElement = document.getElementById("currentPrice-" + maSP + "-" + maKichThuoc + "-" + maMau);
    const originalPriceElement = document.getElementById("originalPrice-" + maSP + "-" + maKichThuoc + "-" + maMau);

 // Cập nhật giá tiền dựa trên số lượng mới
    const currentPrice = quantity * giaHienTai;
    currentPriceElement.innerText = currentPrice + "đ";
    originalPriceElement.innerText = (quantity * giaBanDau) + "đ";

    // Cập nhật tổng tạm tính và tổng tiền
    const allCurrentPrices = document.querySelectorAll(".price");
    let totalTemp = 0;
    allCurrentPrices.forEach((priceElement) => {
        totalTemp += parseInt(priceElement.innerText.replace("đ", ""));
    });
    document.querySelector(".totalTemp").innerText = totalTemp + "đ";
    document.querySelector(".total").innerText = (totalTemp + 30000) + "đ"; // Thêm phí vận chuyển
}

function showErrorToast() {
    toast__Alert({
    title: "Cảnh báo!",
    message: "Số lượng bạn yêu cầu vượt quá số lượng tồn kho",
    type: "error",
    duration: 1000
    });
}

 // Toast function
function toast__Alert({ title = "", message = "", type = "info", duration = 3000 }) {
    const main = document.getElementById("toast__Alert");
    if (main) {
      const toast = document.createElement("div");
  
      // Auto remove toast
      const autoRemoveId = setTimeout(function () {
        main.removeChild(toast);
      }, duration + 1000);
  
      // Remove toast when clicked
      toast.onclick = function (e) {
        if (e.target.closest(".toast__close")) {
          main.removeChild(toast);
          clearTimeout(autoRemoveId);
        }
      };
  
      const icons = {
        success: "fas fa-check-circle",
        info: "fas fa-info-circle",
        warning: "fas fa-exclamation-circle",
        error: "fas fa-exclamation-circle"
      };
      const icon = icons[type];
      const delay = (duration / 1000).toFixed(2);
  
      toast.classList.add("toast__Alert", `toast--${type}`);
      toast.style.animation = `slideInLeft ease .3s, fadeOut linear 1s ${delay}s forwards`;
  
      toast.innerHTML = `
                      <div class="toast__icon">
                          <i class="${icon}"></i>
                      </div>
                      <div class="toast__body">
                          <h3 class="toast__title">${title}</h3>
                          <p class="toast__msg">${message}</p>
                      </div>
                      <div class="toast__close">
                          <i class="fas fa-times"></i>
                      </div>
                  `;
      main.appendChild(toast);
    }
  }