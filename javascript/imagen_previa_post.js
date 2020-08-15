(function () {
    function filePreview(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $(".imagen-previa").html("<img src='" + e.target.result + "' width='100%'>");
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#customFile").change(function () {
        filePreview(this);
    });
})();

