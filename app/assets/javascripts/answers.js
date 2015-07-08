$( document ).ready(function() {
  $('.new_answer').on('submit', function(event){
    event.preventDefault();

    var path = $(this).attr('action')
    var form = $(this).serialize()
    request = $.ajax({
      url: path,
      type: "POST",
      data: form
    })

    request.done(function(response){
      $('.answers').append(response);
      $('.new_answer').val('');
    })

    request.fail(function(response){
      console.log("fail");
      console.log(response);
    })
  });
});
