<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<c:url value="/css/sidebar.css"/>">
<style>
    /* Styling the hover trigger item */
    .hover-item {
        display: inline-block;
        padding: 10px;
        background-color: #007bff;
        color: white;
        cursor: pointer;
        border-radius: 5px;
        margin-bottom: 10px;
    }

    /* Styling the popup */
    .popup-hover {
        width: 150px;
        position: absolute;
        top: 45px; /* Adjust based on the desired popup position */
        right: 10px;
        z-index: 100;
    }
/*    .popup-hover img{
        width: 50px;
        height: 50px;
    }*/
</style>
<div class="navigation">
    <ul>
        <li>
            <a href="#" readonly>
                <span class="icon">
                    <ion-icon name="paw"></ion-icon>
                </span>
                <span class="title" style="font-size: 20px;font-weight: 600;">PetHub</span>

            </a>
        </li>
        <li>
            <a href="<c:url value="/admin/admin.jsp"/>">
                <span class="icon">
                    <ion-icon name="home-outline"></ion-icon>
                </span>
                <span class="title">Dashboard</span>
            </a>
        </li>
        <li>
            <a href="<c:url value="/CustomerControl"/>">
                <span class="icon">
                    <ion-icon name="people-outline"></ion-icon>
                </span>
                <span class="title">Customer</span>
            </a>
        </li>
        <li>
            <a href="<c:url value="/admin/manageEmployee.jsp"/>">
                <span class="icon">
                    <ion-icon name="people-circle-outline"></ion-icon>
                </span>
                <span class="title">Employee</span>
            </a>
        </li>
        <li>
            <a href="<c:url value="/ProductControl"/>">
                <span class="icon">
                    <ion-icon name="cube-outline"></ion-icon>
                </span>
                <span class="title">Item</span>
            </a>
        </li>
        <li>
            <a href="<c:url value="/ServiceControl"/>">
                <span class="icon">
                    <ion-icon name="settings-outline"></ion-icon>
                </span>
                <span class="title">Service</span>
            </a>
        </li>
        <li>
            <a href="<c:url value="/admin/manageRegisteredPet.jsp"/>">
                <span class="icon">
                    <ion-icon name="paw-outline"></ion-icon>
                </span>
                <span class="title">Pet</span>
            </a>
        </li>
        <li>
            <a href="<c:url value="/admin/manageRevenue.jsp"/>">
                <span class="icon">
                    <ion-icon name="analytics-outline"></ion-icon>
                </span>
                <span class="title">Revenue</span>
            </a>
        </li>
        <li>
            <a href="<c:url value="/admin/managePromotion.jsp"/>">
                <span class="icon">
                    <ion-icon name="pricetags-outline"></ion-icon>
                </span>
                <span class="title">Promotion</span>
            </a>
        </li>
    </ul>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
    // Get elements
    const hoverItem = document.getElementById('hoverItem');
            const popupHover = document.getElementById('popupHover');
            // Function to show popup
                    function showPopup() {
                    popupHover.style.display = 'block';
                    }

            // Function to hide popup
            function hidePopup() {
            popupHover.style.display = 'none';
            }

            // Show popup when mouse enters hoverItem or popupHover
            hoverItem.addEventListener('mouseenter', showPopup);
                    popupHover.addEventListener('mouseenter', showPopup);
                    // Hide popup when mouse leaves both hoverItem and popupHover
                    hoverItem.addEventListener('mouseleave', () => {
                    setTimeout(() => {
                    if (!popupHover.matches(':hover') && !hoverItem.matches(':hover')) {
                    hidePopup();
                    }
                    }, 100); // Small delay to allow mouse to move between elements
                    });
                    popupHover.addEventListener('mouseleave', () => {
                    setTimeout(() => {
                    if (!popupHover.matches(':hover') && !hoverItem.matches(':hover')) {
                    hidePopup();
                    }
                    }, 100);
                    });
            });
</script>