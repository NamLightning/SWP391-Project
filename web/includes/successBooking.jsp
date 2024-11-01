<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap');
    .controls-container {
        z-index: 10;
        display: flex;
        height: 50%;
        width: 70%;
        align-items: flex-start;
        justify-content: center;
        box-shadow: 0 4px 4px rgba(0, 0, 0, 0.25);
        padding: 48px 42px 604px;
    }

    @media (max-width: 991px) {
        .controls-container {
            padding: 0 20px 100px;
        }
    }

    .controls-buttons {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 56px;
        gap: 24px;
        padding: 12px 16px;
        border-radius: 48px;
        background-color: var(--Neutral-Lighter-Grey, #f2f4f5);
    }

    .control-icon {
        aspect-ratio: 1;
        object-fit: contain;
        object-position: center;
        width: 24px;
        align-self: stretch;
        margin: auto 0;
        justify-content: end;
    }

    .booking-confirmation {
        display: flex;
        max-width: 800px;
        padding: 124px 0 0;
        flex-direction: column;
        font-family: 'Plus Jakarta Sans', sans-serif;
    }

    @media (max-width: 991px) {
        .booking-confirmation {
            padding-top: 100px;
        }
    }

    .confirmation-title {
        color: #090a0a;
        text-align: center;
        font-size: 24px;
        font-weight: 700;
    }

    @media (max-width: 991px) {
        .confirmation-title {
            max-width: 100%;
        }
    }

    .confirmation-content {
        display: flex;
        margin-top: 54px;
        width: 100%;
        flex-direction: column;
    }

    @media (max-width: 991px) {
        .confirmation-content {
            max-width: 100%;
            margin-top: 40px;
        }
    }

    .confirmation-message {
        align-self: center;
        display: flex;
        width: 100%;
        flex-direction: column;
        font-size: 18px;
        color: #090a0a;
        font-weight: 400;
        line-height: 28px;
    }

    .confirmation-icon {
        aspect-ratio: 1.12;
        object-fit: contain;
        object-position: center;
        width: 327px;
        align-self: center;
        max-width: 100%;
    }

    .confirmation-text {
        margin-top: 48px;
    }

    @media (max-width: 991px) {
        .confirmation-text {
            max-width: 100%;
            margin-top: 40px;
        }
    }
</style>

<section class="controls-container">
    <section class="booking-confirmation">
        <h1 class="confirmation-title">Booking Confirmed</h1>
        <div class="confirmation-content">
            <div class="confirmation-message">
                <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/2f8479f480571ecbc3a31a2d82e2b80d7c47df2329402d0229447a9b0865ece9?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="confirmation-icon" alt="Booking confirmation icon" />
                <p class="confirmation-text">
                    Thank you for caring to your pet and trust PetHub services! Here's your booking information. You can let our receptionist know by showing your booking ID
                </p>
            </div>
        </div>
    </section>
    <a href="#"><img src="https://cdn.builder.io/api/v1/image/assets/TEMP/2a5de32771d9fb4ee94eedede3b1a1f041ebced7ce07263cfbb6e858b8125029?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" 
                     alt="Control button icon" class="control-icon" loading="lazy"></a>
</section>