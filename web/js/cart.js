function updateQuantityXHR(cartItemId, action) {
const xhr = new XMLHttpRequest();
        xhr.open('POST', 'CartControl?action=' + action + '&cid=' + cartItemId, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        // Handle the server response
        xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
        const data = JSON.parse(xhr.responseText)
                if ('delete' === action){
        const product = document.getElementById(`product-` + cartItemId);
                if (product){
        product.remove();
        }
        const productPopup = document.getElementById(`product-popup-item-` + cartItemId);
                if (productPopup){
        productPopup.remove();
        }
        const newTotalPrice = parseFloat(document.getElementById('subtotal').value) - (data.Price * data.newQuantity);
                if (document.getElementById('amount') !== null){
        document.getElementById('total-value').innerText = newTotalPrice + '₫';
        }
        document.getElementById('subtotal-popup-amount').innerText = newTotalPrice + '₫';
                if (document.getElementById('amount') !== null){
        document.getElementById('amount').value = newTotalPrice;
        }
        document.getElementById('subtotal').value = newTotalPrice;
                if (document.getElementById('grand-total-value') !== null){
        document.getElementById('grand-total-value').innerText = newTotalPrice + '₫';
        }
        } else if (data.newQuantity >= 1){
        document.getElementById(`quantity-` + cartItemId).innerText = data.newQuantity;
                document.getElementById(`quantity-popup-` + cartItemId).innerText = data.newQuantity;
                const newSubTotal = data.Price * data.newQuantity;
                let newTotalPrice;
                if (action === 'decrement'){
        newTotalPrice = parseFloat(document.getElementById('subtotal').value) - data.Price;
        }
        if (action === 'increment'){
        newTotalPrice = parseFloat(document.getElementById('subtotal').value) + data.Price;
        }
        document.getElementById(`product-subtotal-` + cartItemId).innerText = newSubTotal + '₫';
                document.getElementById('total-value').innerText = newTotalPrice + '₫';
                document.getElementById('subtotal-popup-amount').innerText = newTotalPrice + '₫';
                document.getElementById('subtotal').value = newTotalPrice;
                document.getElementById('amount').value = newTotalPrice;
                document.getElementById('grand-total-value').innerText = newTotalPrice + '₫';
        } else if (data.newQuantity === 0){
        const product = document.getElementById(`product-` + cartItemId);
                if (product){
        product.remove();
        }
        const productPopup = document.getElementById(`product-popup-item-` + cartItemId);
                if (productPopup){
        productPopup.remove();
        }
        const newTotalPrice = parseFloat(document.getElementById('subtotal').value) - data.Price;
                document.getElementById('total-value').innerText = newTotalPrice + '₫';
                document.getElementById('subtotal-popup-amount').innerText = newTotalPrice + '₫';
                document.getElementById('amount').value = newTotalPrice;
                document.getElementById('subtotal').value = newTotalPrice;
                document.getElementById('grand-total-value').innerText = newTotalPrice + '₫';
        }
        }
        };
        // Send the request with parameters
        xhr.send();
}