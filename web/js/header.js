<script>
    document.addEventListener("DOMContentLoaded", function() {
        let isLoggedIn = localStorage.getItem("isLoggedIn");

        if (isLoggedIn) {
            document.querySelector(".user-profile").style.display = "flex";
        } else {
            const navMenu = document.querySelector(".nav-menu");
            const loginItem = document.createElement("li");
            loginItem.classList.add("nav-item");
            loginItem.innerHTML = '<a href="login.jsp">Login / Sign Up</a>';
            navMenu.appendChild(loginItem);
        }
    });

    function loginUser() {
        localStorage.setItem("isLoggedIn", true);
        window.location.reload();
    }

    function logoutUser() {
        localStorage.removeItem("isLoggedIn");
        window.location.reload();
    }
</script>
