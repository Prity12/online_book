function filterFunction(){
  var search = $('#book_key').val();
  $.ajax({
    type: "GET",
    url: "/books",
    data: {
      search:search
    }
  });
}

$(document).on('click','.favourite-request', function(e){
    var favourite_val = $(this)
    e.preventDefault();
    var data = {
      favourite: {user_id: $(this).data('user_id'),
        book_id: $(this).data('book_id')
      }
    }
    $.ajax({
      type: "POST",
      url: "/favourites",
      data: data,
      success: function (data) {
        favourite_val.removeClass('favourite-request')
        favourite_val.addClass('favourite-destroy')
        favourite_val.children("i").removeClass('fa fa-star-o')
        favourite_val.children("i").addClass('fa fa-star')
        favourite_val.attr("data-id", data["id"])

      }
    });
  });

  $(document).on('click','.favourite-destroy', function(e){
    var favourite = $(this)
    var id = $(this).attr('data-id')
    e.preventDefault();
    var data = {
        favourite: {user_id: $(this).data('user_id'),
        book_id: $(this).data('book_id')
      }
    }
    $.ajax({
      type: "DELETE",
      url: "/favourites/"+id,
      data: data,
      success: function (data) {
        favourite.removeClass('favourite-destroy')
        favourite.addClass('favourite-request')
        favourite.children("i").removeClass('fa fa-star')
        favourite.children("i").addClass('fa fa-star-o')
        favourite.attr("data-user_id", data["user_id"])
        favourite.attr("data-book_id", data["book_id"])
        favourite.attr("data-id","")
      }
    });
  });
