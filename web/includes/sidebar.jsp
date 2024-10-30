<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<c:url value="/css/sidebar.css"/>">
<div class="navigation">
    <ul>
        <li>
            <a href="#" readdonly>
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
            <a href="<c:url value="/admin/manageCustomer.jsp"/>">
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
            <a href="<c:url value="/admin/manageService.jsp"/>">
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
        <li>
            <a href="<c:url value="/admin/sysNotification.jsp"/>">
                <span class="icon">
                    <ion-icon name="notifications-circle-outline"></ion-icon>
                </span>
                <span class="title">System notification</span>
            </a>
        </li>
    </ul>
</div>