//Annual Plan & Progress Bar
const checks = document.querySelectorAll('.form-check-input');

for (let check of checks) {
    check.addEventListener('change', function () {
        if (this.checked == true) {
            alert('You did a good job!');
        }
        const checkedAnnualPlans = document.querySelectorAll('.annual-plan .form-check-input:checked');
        const progressBar = document.querySelector('.progress-bar');
        const goalsPercent = document.querySelector('.goals-percent');
        progressBar.style.width = checkedAnnualPlans.length / 4 * 100 + '%';
        goalsPercent.innerText = checkedAnnualPlans.length / 4 * 100 + '%';
    });
};

//Monthly Chart
const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: ['Done', 'Not yet'],
        datasets: [{
            label: 'April Plan Progress',
            data: [60, 40],
            backgroundColor: [
                '#A3CEF1',
                '#E7ECEF'
            ],
            hoverOffset: 4
        }]
    }
});

//When changing month, change the chart
const formSelect = document.querySelector('.form-select');

formSelect.addEventListener('change', function () {
    if (formSelect.value === 'may') {
        myChart.data.datasets[0].data[0] = 20;
        myChart.data.datasets[0].data[1] = 80;
        myChart.update();
    } else if (formSelect.value === 'april') {
        myChart.data.datasets[0].data[0] = 60;
        myChart.data.datasets[0].data[1] = 40;
        myChart.update();
    } else if (formSelect.value === 'march') {
        myChart.data.datasets[0].data[0] = 50;
        myChart.data.datasets[0].data[1] = 50;
        myChart.update();
    } else if (formSelect.value === 'february') {
        myChart.data.datasets[0].data[0] = 70;
        myChart.data.datasets[0].data[1] = 30;
        myChart.update();
    } else if (formSelect.value === 'january') {
        myChart.data.datasets[0].data[0] = 40;
        myChart.data.datasets[0].data[1] = 60;
        myChart.update();
    };
});




