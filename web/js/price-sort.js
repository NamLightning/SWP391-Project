document.addEventListener('DOMContentLoaded', function () {
    const priceRange = document.getElementById('priceRange');
    const priceDisplay = document.getElementById('priceDisplay');
    const applyButton = document.querySelector('.apply-button');

    function updatePriceDisplay(value) {
        const formattedValue = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND',
            minimumFractionDigits: 0,
            maximumFractionDigits: 0
        }).format(value);
        priceDisplay.textContent = formattedValue;
    }

    priceRange.addEventListener('input', function () {
        updatePriceDisplay(this.value);
        priceRange.setAttribute('value', this.value);
    });

    applyButton.addEventListener('click', function () {
        const selectedPrice = priceRange.value;
        console.log(`Applying filter with price: ${selectedPrice}`);
    });

    updatePriceDisplay(priceRange.value);
});

function updateCategoryCounts(counts) {
    const countElements = document.querySelectorAll('.category-count');
    countElements.forEach(element => {
        const category = element.getAttribute('data-count');
        const count = counts[category] || 0;
        element.textContent = count;
        element.value = count;
        element.setAttribute('aria-label', `${count} items`);
    });
}

//function createDynamicLine() {
//    const container = document.getElementById('lineContainer');
//    
//    const leftCircle = document.createElement('div');
//    leftCircle.className = 'circle';
//
//
//    const line = document.createElement('div');
//    line.className = 'line';
//
//    const rightCircle = document.createElement('div');
//    rightCircle.className = 'circle';
//
//    container.appendChild(leftCircle);
//    container.appendChild(line);
//    container.appendChild(rightCircle);
//}
//
//function changeColors(circleColor, lineColor) {
//    const circles = document.querySelectorAll('.circle');
//    const line = document.querySelector('.line');
//
//    circles.forEach(circle => {
//        circle.style.backgroundColor = circleColor;
//    });
//    line.style.backgroundColor = lineColor;
//}
//createDynamicLine();
//setTimeout(() => {
//    changeColors('blue', 'green');
//}, 2000);

