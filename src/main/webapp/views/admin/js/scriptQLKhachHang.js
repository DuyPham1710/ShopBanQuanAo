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