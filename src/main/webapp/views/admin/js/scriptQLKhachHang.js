/**
 * 
 */
function drawMonthlySalesChart(canvasId, labels, data) {
    // Lấy đối tượng canvas
    const ctx = document.getElementById(canvasId).getContext('2d');

    // Cấu hình và vẽ biểu đồ
    new Chart(ctx, {
        type: 'bar', // Loại biểu đồ: cột
        data: {
            labels: labels,
            datasets: [{
                label: 'Số khách hàng mua từng tháng',
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

function locKhachHang(){
	document.getElementById("locKhachHang").submit();
}

function loadNguoiDung(idNguoiDung){
	fetch(`/project_web/qlKhachHangController?_method=loadThongTinKhachHang`, {
	        method: "POST",
	        headers: {
	        	"Content-Type": "application/json",
				"iDNguoiDung" : idNguoiDung,
	        },
			body: JSON.stringify({
		    }),
	    })
	    .then(response => response.text())
	    .then(data => {
	        // Chèn dữ liệu trả về từ Controller vào Modal
	        document.querySelector('#thongTinNguoiDung .modal-body').innerHTML = data;
	        // Hiển thị Modal
	        const modal = new bootstrap.Modal(document.getElementById('thongTinNguoiDung'));
	        modal.show();
	    })
	    .catch(error => {
	        console.error("Error:", error);
	        alert("Không thể tải !");
	    });
}
function DongModal(){
	// Đóng modal khi bấm nút close
	var modalElement = document.getElementById('thongTinNguoiDung');
	  var modal = bootstrap.Modal.getInstance(modalElement); // Lấy instance của modal
	  modal.hide(); // Ẩn modal
}