
  /*   function formatCurrency(value) {
        return value.toLocaleString('vi-VN'); // 'vi-VN' sẽ sử dụng dấu chấm cho hàng nghìn theo chuẩn Việt Nam
    } */

document.getElementById("selectAll").addEventListener("change", function () {
    const checkboxes = document.querySelectorAll(".cart-item input[type='checkbox']");
    checkboxes.forEach(function (checkbox) {
        checkbox.checked = this.checked;
		console.log("aa");
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
				let value1 =value;
		        // Đảm bảo số lượng không nhỏ hơn 1
		        if (quantity < 1) {
		            quantity = 1;
					value1=0;
					value=0;
		        }
		        if (quantity > soLuongSP) {
					value=0;
		            // Hiển thị toast khi số lượng vượt quá tồn kho
		           	showErrorToast();
		            quantity = soLuongSP; // Đặt lại số lượng về giá trị tối đa
					value1=0;
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
				
				let tmp = maSP+","+maKichThuoc+","+maMau;
			  	if (listCheck.has(tmp)) {
					// Cập nhật tổng tạm tính và tổng tiền
					let tongTienElement = document.getElementById("tongTienTamTinh");

					if (tongTienElement) {
					    // Lấy giá trị text của phần tử và loại bỏ chữ "đ" rồi chuyển thành số
					    let tongGiaTamTinh = parseInt(tongTienElement.textContent.replace("đ", "").trim());
					    console.log(tongGiaTamTinh); // Kiểm tra kết quả
						tongGiaTamTinh += value1*giaHienTai;
				        document.querySelector(".totalTemp").innerText = tongGiaTamTinh + "đ";
				        document.querySelector(".total").innerText = (tongGiaTamTinh + 30000) + "đ"; // Thêm phí vận chuyển
						document.getElementById("totalTempThanhToan").value = tongGiaTamTinh;
					} else {
					    console.log("Element with id 'tongTienTamTinh' not found.");
					}

					
					
			  	} 
		        

		        $.ajax({
		            type: "POST",
		            url: "/project_web/GioHangController",// Đường dẫn của Servlet
		            data: { 
		            	id: maSP ,
		            	_method: "capNhatGioHang",
		            	sizeoption: maKichThuoc,
		    			coloroption: maMau,
		            	quantity: value},
		            success: function(response) {
		            	
		                $("#response").text(response.message);},
		            error: function(xhr, status, error) {
		                console.error("Error: " + error);
		            }
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
  function capNhatDanhSachMua(checkBox, maSP, maKichCo,maMau){
	let currentPriceElement = document.getElementById("currentPrice-" + maSP + "-" + maKichCo + "-" + maMau);
	let tongTienElement = document.getElementById("tongTienTamTinh");
    let tongGiaTamTinh = parseInt(tongTienElement.textContent.replace("đ", "").trim());
	let tongGiaSanPham = parseInt(currentPriceElement.textContent.replace("đ", "").trim());
	let tmp = maSP+","+maKichCo+","+maMau;
	if (checkBox.checked) {
		listCheck.add(tmp);
		tongGiaTamTinh += tongGiaSanPham;
	}
	else{
		listCheck.delete(tmp);
		tongGiaTamTinh -= tongGiaSanPham;
		document.getElementById('selectAll').checked = false;
	}
	document.querySelector(".totalTemp").innerText = tongGiaTamTinh + "đ";
    document.querySelector(".total").innerText = (tongGiaTamTinh + 30000) + "đ"; // Thêm phí vận chuyển
	let setArray = Array.from(listCheck);  // Chuyển Set thành mảng
	let setString = setArray.join(",");  // Nối các phần tử thành chuỗi, phân cách bằng dấu phẩy
	// Gán chuỗi vào giá trị của input
	document.getElementById("listSPCheck").value = setString;
	document.getElementById("totalTempThanhToan").value = tongGiaTamTinh;	
	console.log(tmp);
	console.log(listCheck);
  }