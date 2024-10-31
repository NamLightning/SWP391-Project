<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </head>
    <body>
    <center>
        <%@include file="includes/header.jsp"%>
        <div class="main-container">
            <%@include file="includes/userMenu.jsp"%>
            <section class="vip-content">
                <div class="content-wrapper">
                    <div class="points-container">
                        <div class="main-column">
                            <div class="points-display">
                                <div class="points-info">
                                    <div class="vip-points-badge">
                                        <span>Your VIP Points :</span>
                                        <span class="points-value">20</span>
                                    </div>
                                    <div class="tier-container">
                                        <div class="bronze">
                                            <span>100 Points</span>
                                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/81440a2eb15191807b96b744e54d31e7f53a24bdd9196a6051ee4e07af5ccf63?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="100 Points Tier Icon" class="tier-icon" />
                                            <span class="tier-discount">2,5% Discount</span>
                                        </div>
                                        <div class="silver">
                                            <span>200 Points</span>
                                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/81b5d848fffd472633e610d7d39f69bd32c7450b8013cc493c998a5f0fd31681?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="200 Points Tier Icon" class="tier-icon" />
                                            <span class="tier-discount">5% Discount</span>
                                        </div>
                                        <div class="gold">
                                            <span>500 Points</span>
                                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/455a1b15bcfa6fb7a96e4246286756cfcb5e9aa2f21b4fde8a85fff4a1fbb5e8?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="500 Points Tier Icon" class="tier-icon" />
                                            <span class="tier-discount">7,5% Discount</span>
                                        </div>
                                        <div class="platinum">
                                            <span>1000 Points</span>
                                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/053e4835c64c7d445f18295fa451456ef0425b950c1390cc068b845ce7ef3bf7?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="1000 Points Tier Icon" class="tier-icon" />
                                            <span class="tier-discount">10% Discount</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="info-box">
                        <p><span style="color: rgba(236, 31, 39, 1)">Note*</span> : VIP Points Required for each rank</p>
                        <p class="info-text">Each 1.000vnđ = 1 Point</p>
                        <p class="info-text">1 Point can be convert to 100vnđ</p>
                    </div>
                </div>
            </section>
        </div>
        <%@include file="includes/footer.jsp"%>
    </center>
</body>
</html>

<style>
    .main-container{
        display: flex;
        margin: 3%;
        gap: 10%;
        justify-content: center;
    }

    .vip-content {
        display: flex;
        width: 556px;
        max-width: 100%;
        flex-direction: column;
    }

    .content-wrapper {
        width: 100%;
    }

    .points-container {
        gap: 20px;
        display: flex;
    }

    .main-column {
        display: flex;
        flex-direction: column;
        line-height: normal;
        width: 81%;
        margin-left: 0;
    }

    .points-display {
        display: flex;
        flex-grow: 1;
        gap: 7px;
        font: 600 14px/1 Public Sans, sans-serif;
    }

    .points-info {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        flex-grow: 1;
        flex-basis: 0;
        width: fit-content;
    }

    .vip-points-badge {
        background: var(--Primary-500, #fa8232);
        display: flex;
        margin-left: 14px;
        gap: 4px;
        color: var(--Gray-00, var(--icon-color, #fff));
        padding: 10px 21px;
    }

    .points-value {
        flex-basis: auto;
    }

    .tier-container {
        display: flex;
        margin-top: 40px;
        width: 233px;
        max-width: 100%;
        gap: 40px 51px;
        color: #000;
    }

    .bronze {
        display: flex;
        flex-direction: column;
        align-items: center;
        flex: 1;
    }

    .silver {
        display: flex;
        flex-direction: column;
        align-items: center;
        flex: 1;
    }

    .tier-icon {
        aspect-ratio: 1;
        object-fit: contain;
        object-position: center;
        width: 64px;
        margin-top: 11px;
    }

    .tier-discount {
        align-self: stretch;
        margin-top: 11px;
    }

    .gold {
        display: flex;
        flex-direction: column;
        align-items: center;
        flex: 1;
    }

    .platinum {
        display: flex;
        flex-direction: column;
        align-items: center;
        flex: 1;
    }


    .info-box {
        border-radius: 10px;
        background-color: #fff;
        box-shadow: 0 4px 4px rgba(0, 0, 0, 0.25);
        align-self: flex-start;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        color: #000;
        margin: 42px 0 -29px;
        padding: 8px 14px;
        font: 600 14px/1 Public Sans, sans-serif;
    }

    .info-text {
        margin-top: 18px;
    }

    @media (max-width: 991px) {
        .vip-content {
            padding: 0 20px 100px 0;
        }

        .content-wrapper {
            max-width: 100%;
        }

        .points-container {
            flex-direction: column;
            align-items: stretch;
            gap: 0;
        }

        .main-column {
            width: 100%;
        }

        .points-display {
            margin-top: 40px;
        }

        .vip-points-badge {
            margin-left: 10px;
            padding: 0 20px;
        }

        .higher-tier {
            margin-top: 40px;
        }

        .secondary-column {
            width: 100%;
        }

        .highest-tier {
            margin-top: 40px;
        }

        .info-box {
            padding-right: 20px;
            margin: 40px 0 10px;
        }
    }
</style>
