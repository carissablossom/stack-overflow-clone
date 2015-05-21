$(function(){
  $("#new_question").on('submit',function(event){
    event.preventDefault();
    var questionTemplate = Handlebars.compile($('#question_template').html());
    var errorTemplate = Handlebars.compile($('#error_template').html());
    $.ajax({
      method: 'POST',
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'json',
      success: function(response){
        $('#kill').remove();
        $('#questions').prepend(questionTemplate(response));
        $('#new_question')[0].reset();
      },
      error: function(response){
        $('#kill').remove();
        $('#question_form').prepend(errorTemplate({ errors: response.responseJSON }));
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
  var parser = new MarkdownParser;
  parser.preview('#question_content','#preview_pane');
});

