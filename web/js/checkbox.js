document.querySelectorAll('.checkbox').forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            if (this.checked) {
                // Uncheck all other checkboxes
                document.querySelectorAll('.checkbox').forEach(otherCheckbox => {
                    if (otherCheckbox !== this) {
                        otherCheckbox.checked = false;
                        this.checked=true;
                    }
                });
                // Navigate to the URL
                window.location.href = this.getAttribute('data-url');
            }
        });
    });