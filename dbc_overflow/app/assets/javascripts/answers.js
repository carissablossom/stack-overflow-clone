$(function(){
  $('#new_answer').on('submit', function(event){
    event.preventDefault();
    var answerTemplate = Handlebars.compile($('#answer_template').html());
    var errorTemplate = Handlebars.compile($('#error_template').html());
    $.ajax({
      method: 'POST',
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'json',
      success: function(response){
        $('#kill').remove();
        $("#answers").prepend(answerTemplate(response));
        $('#new_answer')[0].reset();
      },
      error: function(response){
        $('#kill').remove();
        $('#answer_form').prepend(errorTemplate({ errors: response.responseJSON }));
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
  var parser = new MarkdownParser;
  parser.preview('#answer_content', '#preview_pane');
});
