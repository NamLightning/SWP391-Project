let quantity = 1;

function increaseQuantity() {
    quantity++;
    updateQuantityDisplay();
}

function decreaseQuantity() {
    if (quantity > 1) {
        quantity--;
        updateQuantityDisplay();
    }
}

function updateQuantityDisplay() {
    document.getElementById("quantity").innerText = quantity.toString().padStart(2, '0');
}

//function updateQuantityDisplay() {
//    document.getElementById("quantityy").innerText = quantity.toString().padStart(2, '0');
//}