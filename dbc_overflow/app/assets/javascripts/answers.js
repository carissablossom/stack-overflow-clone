$(document).ready(function() {

  var answer_form = function(answer) {
    form = '<h3><strong>' +answer.content+ '</strong></h3>' +
  '<form action="/questions/' +answer.question_id+ '/answers/' +answer.id+ '/upvote"' +
  'class="button_to" method="post"><div><input type="submit" value="upvote" /><input name="authenticity_token"' +
  'type="hidden" value="FgKMyN0qn3AnpDm1TQUrBTauctAALzKtFBsoKASK7qE=" /></div></form>' +
  '<form action="/questions/' +answer.question_id+ '/answers/' +answer.id+ '/downvote"' +
  'class="button_to" method="post"><div><input type="submit" value="downvote" /><input name="authenticity_token"' +
  'type="hidden" value="FgKMyN0qn3AnpDm1TQUrBTauctAALzKtFBsoKASK7qE=" /></div></form>' +
  '<p><em>count: 0</em></p>'
    return form
  }

  $('.new_answer').on('submit', function(e){
    e.preventDefault();
    current = $(this)
    $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
      dataType: 'json',
      data: $(this).serialize(),
    }).done(function(response){
      $('.answers').append(answer_form(response))
      current.find('textarea[name="answer[content]"]').val('')
    });
  });

// need to create new button class for votes, collides with edit/delete

});
