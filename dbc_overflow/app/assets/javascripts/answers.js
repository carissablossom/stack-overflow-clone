$(document).ready(function(){

  $('#new_answer').on('submit', function(event){
      event.preventDefault();
      var request = $.ajax({
        method: 'post',
        url: $(this).attr('action'),
        data: $(this).serialize(),
      })

      request.done(function(response){
        var question = response.title;
        var content = response.content;
        $('#answer-container').prepend(response);
      })
  })

  $('#answer-container').on('click', ".up_tri", function(event){
    event.preventDefault();
    event.stopPropagation();
    // debugger
    var votes = $(this).siblings('p').last()[0];
    var request = $.ajax({
      method: 'get',
      url: $(this).attr('href'),
      dataType: 'json',
    });

    request.done(function(response){
      $(votes).text("vote totals: " + response.vote_totals);
    })
  })

  $('#answer-container').on('click', ".down_tri", function(event){
    event.preventDefault();
    event.stopPropagation();
    var votes = $(this).siblings('p').last()[0];
    var request = $.ajax({
      method: 'get',
      url: $(this).attr('href'),
      dataType: 'json',
    });

    request.done(function(response){
      $(votes).text("vote totals: " + response.vote_totals);
    })
  })

})
