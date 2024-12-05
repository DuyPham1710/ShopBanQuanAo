/**
 * 
 */
let selectedColors = new Set();
let selectedSizes = new Set();
function createChart(config) {
    const { canvasId, sold, inStock } = config;
    const ctxt = document.getElementById(canvasId).getContext('2d');
    new Chart(ctxt, {
        type: 'doughnut',
        data: {
            labels: ['Đã bán', 'Tồn kho'],
            datasets: [{
                data: [sold, inStock],
                backgroundColor: ['#FF6384', '#36A2EB'],
                hoverBackgroundColor: ['#FF6384', '#36A2EB']
            }]
        },
        options: {
            maintainAspectRatio: false,
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                tooltip: {
                    callbacks: {
                        label: function (tooltipItem) {
                            return tooltipItem.label + ': ' + tooltipItem.raw + ' sản phẩm';
                        }
                    }
                }
            }
        }
    });
}

document.addEventListener('DOMContentLoaded', () => {
    const tonKho = parseInt(document.getElementById('tonKho').innerText, 10);
    const daBan = parseInt(document.getElementById('daBan').innerText, 10);

    createChart({
        canvasId: 'visitorChart',
        sold: daBan,
        inStock: tonKho
    });
});




// Function để vẽ biểu đồ
function drawMonthlySalesChart(canvasId, labels, data) {
    // Lấy đối tượng canvas
    const ctx = document.getElementById(canvasId).getContext('2d');

    // Cấu hình và vẽ biểu đồ
    new Chart(ctx, {
        type: 'line', // Loại biểu đồ: cột
        data: {
            labels: labels,
            datasets: [{
                label: 'Doanh thu từng tháng',
                data: data,
                backgroundColor: 'rgba(54, 162, 235, 0.6)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true // Bắt đầu trục Y từ 0
                }
            }
        }
    });
}

function submitYearForm() {
    document.getElementById("yearForm").submit();
}

//Sửa sản phẩm
function loadSanPham(maSP) {
    // Gửi mã đến Controller
    fetch(`/project_web/qlSanPhamController?_method=loadSanPham`, {
        method: "POST",
        headers: {
        	"Content-Type": "application/json",
            "X-MaSP": maSP,
        },
		body: JSON.stringify({
	    }),
    })
    .then(response => response.text())
    .then(data => {
        // Chèn dữ liệu trả về từ Controller vào Modal
        document.querySelector('#editProductModal .modal-body').innerHTML = data;
        // Hiển thị Modal
        const modal = new bootstrap.Modal(document.getElementById('editProductModal'));
        modal.show();
		const colorString = document.getElementById("mauDaDuocChon").value;
		selectedColors = new Set(
		    colorString
		        .split(",") // Tách chuỗi thành mảng dựa trên dấu phẩy
		        .map(item => item.trim()) // Loại bỏ khoảng trắng đầu/cuối từng phần tử (nếu có)
		        .filter(item => item !== "") // Đảm bảo không có chuỗi rỗng
		);
		const sizeString = document.getElementById("sizeDaDuocChon").value;
		selectedSizes = new Set(
				    sizeString
		        .split(",") // Tách chuỗi thành mảng dựa trên dấu phẩy
		        .map(item => item.trim()) // Loại bỏ khoảng trắng đầu/cuối từng phần tử (nếu có)
		        .filter(item => item !== "") // Đảm bảo không có chuỗi rỗng
		);
		setSizeSP();
		setMauSP();
    })
    .catch(error => {
        console.error("Error:", error);
        alert("Không thể tải !");
    });
}

function setMauSP(){
	document.querySelectorAll(".color-circle").forEach(colorCircle => {
	    const color = colorCircle.getAttribute("data-color"); 
	    if (selectedColors.has(color)) {
	        colorCircle.classList.add("selected"); //
	    }
	});
}

function setSizeSP(){
	document.querySelectorAll(".size-option").forEach(sizeOption => {
	    const size = sizeOption.getAttribute("data-size"); // Lấy kích thước từ data-size
	    if (selectedSizes.has(size)) {
	        sizeOption.classList.add("selected"); // Thêm lớp 'selected' nếu kích thước có trong Set
	    }
	});
}




function showImageInput() {
  const inputContainer = document.getElementById('customImageInputContainer');
  if (inputContainer) {
    inputContainer.style.display = 'block';  // Hiển thị ô nhập liệu
  }
}

function confirmImageUpload() {
  const imagePathInput = document.getElementById('customImagePath');
  const imagePreview = document.getElementById('anh');
  if (imagePathInput.value) {
    // Cập nhật ảnh hiển thị
    imagePreview.src = imagePathInput.value;
	document.getElementById("linkAnhEdit").value = imagePathInput.value;
    // Ẩn ô nhập liệu sau khi hoàn thành
    document.getElementById('customImageInputContainer').style.display = 'none';
  } else {
    alert('Vui lòng nhập đường dẫn ảnh!');
  }
}

function luuChinhSua(){
	const sizeString = Array.from(selectedSizes).join(",");
	const colorString = Array.from(selectedColors).join(",");
	document.getElementById("sizeDaDuocChon").value = sizeString;
	document.getElementById("mauDaDuocChon").value = colorString;
        
    if (!confirm("Bạn có chắc chắn muốn sửa?")) {
        return;
    }
	
    fetch(`/project_web/qlSanPhamController?_method=suaSanPham`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
			
        },
        body: JSON.stringify({
			sizeDaDuocChonEdit: sizeString,
	        mauDaDuocChonEdit: colorString,
	        maSanPhamEdit: document.getElementById("maSanPhamEdit").value,
	        tenSPEdit: document.getElementById("tenSPEdit").value,
	        giaSanPhamEdit: document.getElementById("giaSanPhamEdit").value,
	        giamGiaEdit: document.getElementById("giamGiaEdit").value,
	        soLuongEdit: document.getElementById("soLuongEdit").value,
	        maDanhMucEdit: document.getElementById("danhmucEdit").value,
	        linkAnhEdit: document.getElementById("linkAnhEdit").value,
	        xuatXuEdit: document.getElementById("xuatXuEdit").value,
	        chatLieuEdit: document.getElementById("chatLieuEdit").value,
	        moTaEdit: document.getElementById("moTaEdit").value,
			 }),
    })
    .then(response => {
        if (response.ok) {
            alert("Sửa thành công!");
            // Tải lại trang hoặc chuyển hướng nếu cần
            location.reload();
        } else {
            return response.text().then(text => {
                throw new Error(text);
            });
        }
    })
    .catch(error => {
        console.error("Error:", error);
        alert("Có lỗi xảy ra khi sửa sản phẩm: " + error.message);
    });
}
function kiemTraRongKhiEdit() {
	const sizeString = Array.from(selectedSizes).join(",");
	const colorString = Array.from(selectedColors).join(",");
    const tenSP = document.getElementById("tenSPEdit").value.trim();
    const giaSP = document.getElementById("giaSanPhamEdit").value.trim();
    const giamGia = document.getElementById("giamGiaEdit").value.trim();
    const soLuong = document.getElementById("soLuongEdit").value.trim();
    const danhMuc = document.getElementById("danhmucEdit").value.trim();
    const linkAnh = document.getElementById("linkAnhEdit").value.trim();
    const xuatXu = document.getElementById("xuatXuEdit").value.trim();
    const chatLieu = document.getElementById("chatLieuEdit").value.trim();
    const moTa = document.getElementById("moTaEdit").value.trim();

    // Kiểm tra các giá trị
    if (!tenSP || !giaSP || !giamGia || !soLuong || !danhMuc || !linkAnh || !xuatXu || !chatLieu || !moTa || !sizeString || !colorString) {
        alert("Vui lòng điền đầy đủ thông tin vào tất cả các trường!");
        return;
    }
	else{
		luuChinhSua();
	}
}



//add sản phẩm
function loadThongTinAddSP() {
    // Gửi mã đến Controller
    fetch(`/project_web/qlSanPhamController?_method=loadThongTinAddSP`, {
        method: "POST",
        headers: {
        	"Content-Type": "application/json",
        },
		body: JSON.stringify({
	    }),
    })
    .then(response => response.text())
    .then(data => {
        // Chèn dữ liệu trả về từ Controller vào Modal
        document.querySelector('#addProductModal .modal-body').innerHTML = data;
        // Hiển thị Modal
        const modal = new bootstrap.Modal(document.getElementById('addProductModal'));
        modal.show();
		selectedColors = new Set();
		selectedSizes = new Set();
    })
    .catch(error => {
        console.error("Error:", error);
        alert("Không thể tải !");
    });
}

function showImageInputAdd() {
  const inputContainer = document.getElementById('customImageInputContainerAdd');
  if (inputContainer) {
    inputContainer.style.display = 'block';  // Hiển thị ô nhập liệu
  }
}

function confirmImageUploadAdd() {
  const imagePathInput = document.getElementById('customImagePathAdd');
  const imagePreview = document.getElementById('anhAdd');
  if (imagePathInput.value) {
    // Cập nhật ảnh hiển thị
    imagePreview.src = imagePathInput.value;
	document.getElementById("linkAnhAdd").value = imagePathInput.value;
    // Ẩn ô nhập liệu sau khi hoàn thành
    document.getElementById('customImageInputContainerAdd').style.display = 'none';
  } else {
    alert('Vui lòng nhập đường dẫn ảnh!');
  }
}



function toggleColor(element) {
    const color = element.getAttribute("data-color");

    if (selectedColors.has(color)) {
        selectedColors.delete(color); // Bỏ chọn nếu đã chọn trước đó
        element.classList.remove("selected");
    } else {
        selectedColors.add(color); // Thêm màu vào danh sách chọn
        element.classList.add("selected");
    }

}


function toggleSizeSelection(element) {
    const size = element.getAttribute("data-size");

    if (selectedSizes.has(size)) {
        selectedSizes.delete(size); 
        element.classList.remove("selected");
    } else {
        selectedSizes.add(size); 
        element.classList.add("selected");
    }

}

function themSanPham(){
	const sizeString = Array.from(selectedSizes).join(",");
	const colorString = Array.from(selectedColors).join(",");
    console.log(sizeString);
	console.log(colorString);
	console.log(document.getElementById("tenSPAdd").value);
	console.log(document.getElementById("giaSanPhamAdd").value);
	console.log(document.getElementById("giamGiaAdd").value);
	console.log(document.getElementById("soLuongAdd").value);
	console.log(document.getElementById("danhmucAdd").value);
	console.log(document.getElementById("linkAnhAdd").value);
	console.log(document.getElementById("xuatXuAdd").value);
	console.log(document.getElementById("chatLieuAdd").value);
	console.log(document.getElementById("moTaAdd").value);
      
    if (!confirm("Bạn có chắc chắn muốn thêm sản phẩm này?")) {
        return;
    }
	
    fetch(`/project_web/qlSanPhamController?_method=themSanPham`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
			
        },
        body: JSON.stringify({
			sizeDaDuocChonAdd: sizeString,
	        mauDaDuocChonAdd: colorString,
	        tenSPAdd: document.getElementById("tenSPAdd").value,
	        giaSanPhamAdd: document.getElementById("giaSanPhamAdd").value,
	        giamGiaAdd: document.getElementById("giamGiaAdd").value,
	        soLuongAdd: document.getElementById("soLuongAdd").value,
	        maDanhMucAdd: document.getElementById("danhmucAdd").value,
	        linkAnhAdd: document.getElementById("linkAnhAdd").value,
	        xuatXuAdd: document.getElementById("xuatXuAdd").value,
	        chatLieuAdd: document.getElementById("chatLieuAdd").value,
	        moTaAdd: document.getElementById("moTaAdd").value,
			sizeThemVao: document.getElementById("sizeThemVaoAdd").value.trim(),
			mauThemVao: document.getElementById("mauThemVaoAdd").value.trim(),
			 }),
    })
    .then(response => {
        if (response.ok) {
            alert("thêm thành công!");
            // Tải lại trang hoặc chuyển hướng nếu cần
            location.reload();
        } else {
            return response.text().then(text => {
                throw new Error(text);
            });
        }
    })
    .catch(error => {
        console.error("Error:", error);
        alert("Có lỗi xảy ra khi thêm sản phẩm: " + error.message);
    });
}


function kiemTraRongKhiAdd() {
	const sizeString = Array.from(selectedSizes).join(",");
	const colorString = Array.from(selectedColors).join(",");
    const tenSP = document.getElementById("tenSPAdd").value;
    const giaSP = document.getElementById("giaSanPhamAdd").value.trim();
    const giamGia = document.getElementById("giamGiaAdd").value.trim();
    const soLuong = document.getElementById("soLuongAdd").value.trim();
    const danhMuc = document.getElementById("danhmucAdd").value.trim();
    const linkAnh = document.getElementById("linkAnhAdd").value.trim();
    const xuatXu = document.getElementById("xuatXuAdd").value;
    const chatLieu = document.getElementById("chatLieuAdd").value;
    const moTa = document.getElementById("moTaAdd").value;
	const sizeThemVao = document.getElementById("sizeThemVaoAdd").value.trim();
	const mauThemVao = document.getElementById("mauThemVaoAdd").value.trim();
	
    // Kiểm tra các giá trị
    if ((!sizeString && !sizeThemVao) || (!mauThemVao && !colorString) || !tenSP || !giaSP || !giamGia || !soLuong || !danhMuc || !linkAnh || !xuatXu || !chatLieu || !moTa) {
        alert("Vui lòng điền đầy đủ thông tin vào tất cả các trường!");
        return;
	}
	else{
		themSanPham();
	}
}
