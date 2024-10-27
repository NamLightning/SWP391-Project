    let list = document.querySelectorAll(".navigation li");

    function activeLink() {
        list.forEach(item => {
            item.classList.remove("hovered");
        });
        this.classList.add("hovered");
    }

    list.forEach(item => item.addEventListener("mouseover", activeLink));


    let toggle = document.querySelector(".toggle");
    let navigation= document.querySelector(".navigation");
    let main = document.querySelector(".main");

    toggle.onclick = function (){
        navigation.classList.toggle("active");
        main.classList.toggle("active");
    };



    document.querySelectorAll('.more-options-btn').forEach((button, index) => {
        const optionsContainer = button.nextElementSibling;

        // Thêm sự kiện click cho từng nút
        button.addEventListener('click', (event) => {
            event.stopPropagation();

            // Đóng tất cả các container khác trước khi mở cái hiện tại
            document.querySelectorAll('.options-container').forEach((container) => {
                if (container !== optionsContainer) {
                    container.style.display = 'none';
                }
            });

            // Bật/tắt container tương ứng
            optionsContainer.style.display = optionsContainer.style.display === 'none' ? 'block' : 'none';
        });
    });

    // Đóng menu khi nhấn bên ngoài container
    document.addEventListener('click', function(event) {
        const optionsContainer = document.getElementById('optionsContainer');
        const moreOptionsBtn = document.querySelector('.more-options-btn');
        if (!optionsContainer.contains(event.target) && event.target !== moreOptionsBtn) {
            optionsContainer.style.display = 'none';
        }
    });