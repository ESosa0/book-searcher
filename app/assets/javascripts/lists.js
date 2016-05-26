$(function() { 

  $('#list_id').change(function(){
    var id = $(this).val();
    window.location.href = '/lists/'+ id;
  });

  $('.more-info').click(function(event){
    event.preventDefault();

    $('#book-info').empty();
    
    var name = $(event.currentTarget).data('name');
    var id = $(event.currentTarget).data('id');
    var author = $(event.currentTarget).data('author');
    var isbn = $(event.currentTarget).data('primaryIsbn13');
    var description = $(event.currentTarget).data('description');
    var weeksOnList = $(event.currentTarget).data('weeksOnList');
    var amazonProductUrl = $(event.currentTarget).data('amazonProductUrl');
    var imageUrl = $(event.currentTarget).data('image');
    var rank = $(event.currentTarget).data('rank');
    var bookPath = $(event.currentTarget).data('path');

    if($(window).width() <= 992){
      window.location.href = '/books/' + id;
    }

    $('#book-info').append('<img src= ' + imageUrl + '>' );
    $('#book-info').append('<a href="/books/' + id + '"' + '><h3>' + name + '<h3></a>');
    $('#book-info').append('<h4>' + author + '<h4>');
    $('#book-info').append('<p>' + 'Isbn13: ' + isbn + '</p>');
    $('#book-info').append('<p> Rank: ' + rank + '</p>');
    $('#book-info').append('<p> Number of weeks on Best Seller list: ' + weeksOnList + '</p>');
    $('#book-info').append('<p> Description: ' + description + '</p>');
    $('#book-info').append('<p> <a href="' + bookPath + '">See the reviews</a></p>');


    $('#buy-button').removeClass('hidden');
    $('#book-info').removeClass('hidden');

  });

});