
<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap');

    .navigation-sidebar {
        border-radius: 4px;
        border: 1px solid #e4e7e9;
        background: #fff;
        box-shadow: 0 8px 40px rgba(0, 0, 0, 0.08);
        display: none;
        height: fit-content;
        flex-direction: column;
    }

    .nav-item {
        display: flex;
        width: auto;
        gap: 12px;
        color: rgba(27, 31, 38, 0.72);
        white-space: nowrap;
        padding: 10px 24px;
        text-decoration: none;
        text-align: left;
    }

    .dashboard-nav-item {
        display: flex;
        width: auto;
        gap: 11px;
        font-weight: 600;
        padding: 14px 53px 14px 24px;
        border: 1px solid #e4e7e9;
    }

    .user-avatar {
        aspect-ratio: 1;
        object-fit: cover;
        object-position: center;
        /*width: 40px;*/
        border-radius: 20px;

    }

    .user-info {
        align-self: flex-start;
        display: flex;
        flex-direction: column;
        width: 50px;
    }

    .user-name {
        color: #000;
        align-self: flex-start;
        font: 15px/1 'Poppins', sans-serif;
        margin: 3%;
    }

    .user-points {
        color: #828282;
        font: 11px 'Poppins', sans-serif;
        margin:0;
    }

    .nav-icon {
        aspect-ratio: 1;
        object-fit: contain;
        object-position: center;
        width: 20px;
        color: rgba(27, 31, 38, 0.72);
    }

    .nav-text {
        flex-grow: 1;
        width: 180px;
        font-family: 'Poppins', sans-serif;
    }

    .nav-item active{
        background-color: rgba(27, 31, 38, 0.72);
        color: #ffffff;
        width: auto;
    }

</style>


<nav class="navigation-sidebar popup-hover2" id="popupHover">
    <a href="userProfile.jsp" class="dashboard-nav-item" style="text-decoration: none;">
        <!--<img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/a941b2e9410775a652bd7701d03ebf4c9db560ba6aeb91f78f1562a8451d0287?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="user-avatar" alt="User avatar" />-->
        <img src="${reuse.loadImage(account.getAvatar_img())}" alt=" " class="user-avatar" />
        <div class="user-info">
            <h3 class="user-name">${us}</h3>
            <p class="user-points"> VIP Points: 20</p>
        </div>
    </a>
    <a href="orderHistory.jsp" class="nav-item">
        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/783f08ba87059596b546d1dd556b422416ccd1263e99be3f2dd01ccd51bcb72c?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="nav-icon" />
        <span class="nav-text">Order History</span>
    </a>
    <a href="bookingHistory.jsp" class="nav-item">
        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/a15d41eb648f2a01b5e1e7a318ad8d5b80733ccb989bf7b4e44e20a236dc4745?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="nav-icon" />
        <span class="nav-text">My Bookings</span>
    </a>
    <a href="cart.jsp" class="nav-item">
        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/cdf0d742ca5baa978843bb22697173634a874b5ffa22f6d12fc3f533cdd8af4a?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="nav-icon" />
        <span class="nav-text">Shopping Cart</span>
    </a>
    <a href="vipPage.jsp" class="nav-item">
        <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/48db08d440d91cdb57b2d69f653e30dca394bf6601dd8d8bfd640729a29054f8?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="nav-icon" alt="Content image" />
        <span class="nav-text">VIP Points</span>
    </a>
    <a href="${pageContext.request.contextPath}/LogOutControl" class="nav-item">
        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/36688a5e1071d984f472990a15ab664beea02593b49f48d74f5239b4a1dddecc?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="nav-icon" />
        <span class="nav-text">Log-out</span>
    </a>
</nav>