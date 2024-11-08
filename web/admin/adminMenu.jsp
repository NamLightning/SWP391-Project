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


<nav class="navigation-sidebar popup-hover" id="popupHover">
    <a href="${pageContext.request.contextPath}/LogOutControl" class="nav-item">
        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/36688a5e1071d984f472990a15ab664beea02593b49f48d74f5239b4a1dddecc?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="nav-icon" />
        <span class="nav-text">Log-out</span>
    </a>
</nav>