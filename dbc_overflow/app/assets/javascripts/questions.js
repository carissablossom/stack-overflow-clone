$(function(){
  $("#new_question").on('submit',function(event){
    event.preventDefault();
    $.ajax({
      method: 'POST',
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'json',
      success: function(response){
        $.each($('.kill'), function(index,value){
          value.remove();
        });
        var insert = $("<div class='question' id='"+response.id+"Q'><a href='/questions/"+response.id+"'><h2>"+response.title+"</h2></a><p>"+response.content+"</p><a class='upvoteQ' href='/questions/"+response.id+"/upvote'>Upvote</a><span> "+response.vote+" </span><a class='downvoteQ' href='/questions/"+response.id+"/downvote'>Downvote</a></div>")
        $('#questions').prepend(insert);
        $('#new_question')[0].reset();
      },
      error: function(response){
        $.each($('.kill'), function(index,value){
          value.remove();
        });
        $.each(response.responseJSON, function(index,value){
          $("#question_form").prepend($("<p class='kill'>"+value+"</p>"));
        });
        $("#question_form").prepend($("<p class='kill'>Errors prevented this from saving:</p>"));
      }
    });
  });
  $("#questions").on('click', '.upvoteQ', function(event){
    event.preventDefault();
    $.ajax({
      method: 'get',
      url: $(this).attr('href'),
      success: function(response){
        $('#'+response.id+'Q span').html(response.count)
      }
    });
  });
  $("#questions").on('click', '.downvoteQ', function(event){
    event.preventDefault();
    $.ajax({
      method: 'get',
      url: $(this).attr('href'),
      success: function(response){
        $('#'+response.id+'Q span').html(response.count)
      }
    });
  });
});
