$(function(){

  $('.new_question').on('submit', function(event){
    event.preventDefault();
    var source   = $("#entry-template").html();
    var template = Handlebars.compile(source);

    var request = $.ajax({
      type: $(this).attr('method'),
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'JSON'
    });
      // debugger;

    request.done(function(response){
      // console.log(response)
      $('.error_messages').remove();

      // var source   = $("#new_question-template").html();
      // var template = Handlebars.compile(source);
      // var context = {question: response};
      // var html    = template(context);

      $('.questions').append(template(response));
    });

  })

});
