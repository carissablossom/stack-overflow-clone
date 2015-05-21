$(document).ready(function(){
  questionBindings();
  answerBindings();
})

function answerBindings(){
  $('#new_answer').on('submit', newAnswer)
}

var newAnswer = function(event) {
  event.preventDefault();
  var source = $('#build_answer').html();
  var template = Handlebars.compile(source);
  $.ajax({
    url: $(this).attr('action'),
    data: $(this).serialize(),
    dataType: 'JSON',
    type: 'POST'
  }).done(function(data){
    debugger
    $('ul').append(template(data))
  })
}
