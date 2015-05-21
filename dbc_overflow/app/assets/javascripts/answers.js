// $(document).on('page:load', questionBindings);

// $(document).ready(function(){
//   questionBindings();
//   answerBindings();
// });


function answerBindings(){
  $('#answer_list').on('click', '.a_upvote', upVote);
  $('#answer_list').on('click', '.a_downvote', downVote);
  $('#new_answer').on('submit', newAnswer);

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
    console.log("ajaxing");
    $('ul').append(template(data));
  }).fail(function(data){
    console.log("fuckedup fail");
  });
}


