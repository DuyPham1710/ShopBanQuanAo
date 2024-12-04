/**
 * 
 */
function createChart(config) {
    const { canvasId, sold, delivering } = config;
    const ctxt = document.getElementById(canvasId).getContext('2d');
    new Chart(ctxt, {
        type: 'doughnut',
        data: {
            labels: ['Đã giao','Đang giao'],
            datasets: [{
                data: [sold, delivering],
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
                            return tooltipItem.label + ': ' + tooltipItem.raw + ' đơn';
                        }
                    }
                }
            }
        }
    });
}

document.addEventListener('DOMContentLoaded', () => {
    const daGiao = parseInt(document.getElementById('daGiao').innerText, 10);
    const dangGiao = parseInt(document.getElementById('dangGiao').innerText, 10);

    createChart({
        canvasId: 'visitorChart',
        sold: daGiao,
        delivering: dangGiao
    });
});