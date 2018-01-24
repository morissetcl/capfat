window.preview = function (input) {
  filename = input.files[0]['name'].split('.')[0]
  if (input.files && input.files[0]) {
    $(input.files).each(function () {
      var reader = new FileReader();
      reader.readAsDataURL(this);
      reader.onload = function (e) {
          $("#preview").attr('id', filename);
          $("#"+ filename).append("<img class='thumb' id= " + filename + " src='" + e.target.result + "'>");
      }
    });
  }
}
