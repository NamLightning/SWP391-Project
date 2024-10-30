function showFileName(event, fileNameId) {
    const input = event.target;
    const fileName = input.files[0].name;
    const fileNameElement = document.getElementById(fileNameId);
    fileNameElement.textContent = fileName;
}

$(document).ready(function () {
    $('input[name="star"]').click(function () {
        var rating = $(this).val();
        $.ajax({
            url: 'RatingServlet',
            type: 'POST',
            data: {star: rating},
            success: function (response) {
                $('#ratingResult').html(response);
            },
            error: function (xhr, status, error) {
                console.error("AJAX Error: " + status + error);
            }
        });
    });
});
