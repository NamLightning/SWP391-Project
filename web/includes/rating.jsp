<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap');
    .leave-rating {
        display: flex;
        flex-direction: column;
        max-width: 472px;
        border-radius: 4px;
        border: 1px solid #e4e7e9;
        background: #fff;
        box-shadow: 0 8px 40px rgba(0, 0, 0, 0.12);
    }

    .rating-header {
        width: auto;
        padding: 16px 24px;
        border: 1px solid #e4e7e9;
        background: #fff;
        color: #191c1f;
        text-transform: uppercase;
        font: 600 18px/1 Poppins, sans-serif;
    }

    .rating-content {
        display: flex;
        flex-direction: column;
        width: 424px;
        max-width: 100%;
        padding: 24px;
    }

    .rating-form {
        display: flex;
        flex-direction: column;
        width: 100%;
    }

    .form-group {
        display: flex;
        flex-direction: column;
        width: 100%;
        max-width: 424px;
    }

    .form-label {
        color: #191c1f;
        font: 600 14px/1 Public Sans, sans-serif;
    }

    .rating-input {
        display: flex;
        gap: 8px;
        margin: 8px 0;
        padding: 12px 16px;
        border-radius: 2px;
        border: 1px solid #e4e7e9;
        background: #fff;
    }

    .star-container {
        display: flex;
    }

    .star-icon {
        width: 16px;
        height: 16px;
    }

    .rating-text {
        display: flex;
        gap: 40px 100px;
        color: #475156;
        flex-grow: 1;
        font: 400 14px/1 Public Sans, sans-serif;
        padding-top: 2px;
    }

    .feedback-input {
        margin-top: 8px;
        width: 100%;
        padding: 12px 16px 92px;
        color: #929fa5;
        border-radius: 2px;
        border: 1px solid #e4e7e9;
        background: #fff;
        resize: none;
    }

    .submit-button {
        align-self: flex-start;
        margin-top: 24px;
        padding: 0 32px;
        border-radius: 3px;
        border-style: hidden;
        background: #fa8232;
        color: #fff;
        letter-spacing: 0.19px;
        font: 700 14px/56px Public Sans, -apple-system, Roboto, Helvetica, sans-serif;
    }

</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<section class="leave-rating">
    <header class="rating-header">RATE FOR US</header>
    <div class="rating-content">
        <form class="rating-form">
            <div class="form-group">
                <label for="rating-stars" class="form-label">Rating</label>
                <div class="rating-input" aria-describedby="current-rating">
                    <div class="star-container" id="star-container">
                        <span class="star-icon" data-rating="1" role="button" tabindex="0" aria-label="Rate 1 star">?</span>
                        <span class="star-icon" data-rating="2" role="button" tabindex="0" aria-label="Rate 2 stars">?</span>
                        <span class="star-icon" data-rating="3" role="button" tabindex="0" aria-label="Rate 3 stars">?</span>
                        <span class="star-icon" data-rating="4" role="button" tabindex="0" aria-label="Rate 4 stars">?</span>
                        <span class="star-icon" data-rating="5" role="button" tabindex="0" aria-label="Rate 5 stars">?</span>
                    </div>
                    <div class="rating-text">
                        <span id="current-rating">0 Star Rating</span>
                        <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"></svg>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="feedback" class="form-label">Feedback</label>
                <textarea id="feedback" class="feedback-input" placeholder="Write down your feedback about our product & services"></textarea>
            </div>
            <button type="submit" class="submit-button">Publish Review</button>
        </form>
    </div>
</section>
<script src="../js/rating.js"></script>