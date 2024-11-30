/**
 * 
 */
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
        type: 'bar', // Loại biểu đồ: cột
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
    })
    .catch(error => {
        console.error("Error:", error);
        alert("Không thể tải !");
    });
}
