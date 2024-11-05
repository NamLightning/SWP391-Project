document.addEventListener('DOMContentLoaded', function () {
    const starContainer = document.getElementById('star-container');
    const currentRating = document.getElementById('current-rating');
    const ratingForm = document.getElementById('rating-form');
    let selectedRating = 0;

    function updateStars(rating) {
        const stars = starContainer.children;
        for (let i = 0; i < stars.length; i++) {
            stars[i].textContent = i < rating ? '★' : '☆';
            stars[i].style.color = i < rating ? '#fa8232' : '#e4e7e9';
        }
        currentRating.textContent = `${rating} Star Rating`;
    }

    starContainer.addEventListener('mouseover', function (e) {
        if (e.target.classList.contains('fa fa-star')) {
            updateStars(parseInt(e.target.dataset.rating));
        }
    });

    starContainer.addEventListener('mouseout', function () {
        updateStars(selectedRating);
    });

    starContainer.addEventListener('click', function (e) {
        if (e.target.classList.contains('fa fa-star')) {
            selectedRating = parseInt(e.target.dataset.rating);
            updateStars(selectedRating);
        }
    });

    starContainer.addEventListener('keydown', function (e) {
        if (e.target.classList.contains('fa fa-star') && (e.key === 'Enter' || e.key === ' ')) {
            e.preventDefault();
            selectedRating = parseInt(e.target.dataset.rating);
            updateStars(selectedRating);
        }
    });

    ratingForm.addEventListener('submit', function (e) {
        e.preventDefault();
        if (selectedRating === 0) {
            alert('Please select a rating before submitting.');
            return;
        }
        const feedback = document.getElementById('feedback').value;
        console.log(`Submitted rating: ${selectedRating}, Feedback: ${feedback}`);
    });
});