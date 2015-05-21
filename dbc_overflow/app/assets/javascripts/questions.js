

function questionBindings(){
  $('#new_question').on('submit', submitQuestion);
  $('#question_list').on('click','.upvote' , upVote);
  $('#question_list').on('click','.downvote' , downVote);
}

var submitQuestion = function(event){
  event.preventDefault();

  var source = $('#question-display').html();
  var template = Handlebars.compile(source);

  $.ajax({
    url: $(this).attr('action'),
    type: 'POST',
    data: $(this).serialize(),
    dataType: 'JSON',
  }).done(function(data){
    // debugger
    $('#question_list').append(template(data))

  })
}

var upVote = function(event){
  event.preventDefault();
  // debugger
  var charlie = $(this).closest('li').find('p')
  var req = $.ajax({
    type: 'PATCH',
    url: $(this.closest('form')).attr('action'),
    dataType: 'JSON',
  })
  req.done(function(data) {
    charlie.text(data)
  })
}

var downVote = function(event){
  event.preventDefault();
  var tom = $(this).closest('li').find('p')

  var req = $.ajax({
    type: 'PATCH',
    url: $(this.closest('form')).attr('action'),
    dataType: 'JSON',
  })

  req.done(function(data) {
    tom.text(data)
  })

}





