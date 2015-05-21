$(function(){
  $('#new_answer').on('submit', function(event){
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
        var insert = $("<li id='"+response.id+"A'><h3>"+response.title+"</h3><p>"+response.content+"</p><a class='upvoteA' href='/answers/"+response.id+"/upvote'>Upvote</a><span>"+response.vote+"</span><a class='downvoteA' href='/answers/"+response.id+"/downvote'>downvote</a></li>")
        $("#answers").prepend(insert);
        $('#new_answer')[0].reset();
      },
      error: function(response){
        $.each($('.kill'), function(index,value){
          value.remove();
        });
        $.each(response.responseJSON, function(index,value){
          $("#answer_form").prepend($("<p class='kill'>"+value+"</p>"));
        });
        $("#answer_form").prepend($("<p class='kill'>Errors prevented this from saving:</p>"));
      }
    });
  });
  $("#answers").on('click', '.upvoteA', function(event){
    event.preventDefault();
    $.ajax({
      method: 'get',
      url: $(this).attr('href'),
      success: function(response){
        $('#'+response.id+'A span').html(response.count)
      }
    });
  });
  $("#answers").on('click', '.downvoteA', function(event){
    event.preventDefault();
    $.ajax({
      method: 'get',
      url: $(this).attr('href'),
      success: function(response){
        $('#'+response.id+'A span').html(response.count)
      }
    });
  });
});