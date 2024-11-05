let quantities = {
    "quantity-1": 1,
    "quantity-2": 3
};

function increaseQuantity(id) {
    quantities[id]++;
    updateQuantityDisplay(id);
}

function decreaseQuantity(id) {
    if (quantities[id] > 1) {
        quantities[id]--;
        updateQuantityDisplay(id);
    }
}

function updateQuantityDisplay(id) {
    document.getElementById(id).innerText = quantities[id].toString().padStart(2, '0');
}