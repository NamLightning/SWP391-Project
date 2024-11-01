document.addEventListener('DOMContentLoaded', function () {
    const ctx = document.getElementById('lineChart').getContext('2d');
    const myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: [],
            datasets: [{
                    label: 'Real-Time Data',
                    data: [],
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1,
                    fill: false,
                }
            ]
        }
        ,
        options: {
            responsive: true, // Enable responsive resizing
            maintainAspectRatio: true, // Allows custom aspect ratio
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    }
    );
    const maxDataPoints = 10;
    function fetchData() {
        const xhr = new XMLHttpRequest();
        xhr.open('GET', '/SWP_PetHub//DataServlet', true);
        xhr.onload = function () {
            if (xhr.status === 200) {
                // Inject the returned HTML into the page
                document.getElementById('data-container').innerHTML = xhr.responseText;
                // Parse the HTML to get the value
                const parser = new DOMParser();
                const doc = parser.parseFromString(xhr.responseText, 'text/html');
                const label = doc.querySelector('p').innerText.split(': ')[2];
                // Get label
                const value = parseInt(doc.querySelectorAll('p')[1].innerText.split(': ')[1]);
                // Get value

                // Update the chart
                if (myChart.data.labels.length > maxDataPoints) {
                    myChart.data.labels.shift();
                    // Remove the first label
                    myChart.data.datasets[0].data.shift();
                    // Remove the first data point
                }
                myChart.data.labels.push(label);
                myChart.data.datasets[0].data.push(value);
                myChart.update();
            }
        }
        ;
        xhr.send();
    }

    // Call fetchData at regular intervals
    setInterval(fetchData, 30000);
    // Fetch data every 30 seconds
}
); // This closes the DOMContentLoaded event listener