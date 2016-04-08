$(function() {
  $('#list_id').change(function(){
    var id = $(this).val();
    window.location.href = '/lists/'+ id;
  });
});