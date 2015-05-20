$(document).ready(function(){
  $('.new_question').on('submit', function(e){
    e.preventDefault();
    var data = $('.new_question').serialize();
    var url = $('.new_question').attr('action');
    var source = $('#question-template').html();
    var template = Handlebars.compile(source);

    var req = $.ajax({
      url: url,
      type: 'POST',
      data: data,
      dataType: 'JSON'
    });

    req.done(function(response){
      debugger
      $('#question_list').append(template(response))
      debugger
    });

    req.fail(function(data){

    });

  });
});
