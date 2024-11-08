function changeQuantity(value, maxValue) {
    // Lấy phần tử hiển thị số lượng
    const quantityElement = document.getElementById("quantity");
    let quantity = parseInt(quantityElement.innerText);
    
    // Tăng hoặc giảm số lượng
    quantity += value;
    
    // Đảm bảo số lượng không nhỏ hơn 1
    if (quantity < 1) {
        quantity = 1;
    }
    
    if (quantity > maxValue) {
        // Hiển thị toast khi số lượng vượt quá tồn kho
        showErrorToast();
        quantity = maxValue; // Đặt lại số lượng về giá trị tối đa
    }
    // Cập nhật lại giá trị số lượng trên trang
    quantityElement.innerText = quantity;
    hiddenQuantity.value = quantity;
}
function setSize(button, size) {
    const hiddenSize = document.getElementById("hiddenSize");
    hiddenSize.value = size; // Cập nhật giá trị ẩn khi chọn size
}

/*function addToCart() {
    const maSP = $('#maSP').val();
    const soLuong = $('#hiddenQuantity').val();
    const size = $('#hiddenSize').val();
    const color = $('#tenmau').val();

    $.ajax({
        url: './ChiTietSPController',
        type: 'POST',
        data: {
            maSP: maSP,
            soLuong: soLuong,
            size: size,
            tenmau: color,
        },
        success: function(response) {
            showSuccessToast();
        },
        error: function(xhr, status, error) {
            alert('Có lỗi xảy ra khi thêm vào giỏ hàng');
        }
    });
}*/

function showSuccessToast() {
        toast__Alert({
        title: "Thành công!",
        message: "Thêm giỏ hàng thành công.",
        type: "success",
        duration: 1000
        });
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