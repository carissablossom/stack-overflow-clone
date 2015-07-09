//upvote a question
$(document).on('ajax:success', '.upvote-question', function(event, response, status, xhr) {
  $('.votes').html('');
  $('.votes').append(response);
});

$(document).on('ajax:error', '.upvote-question', function(event, response, status, xhr) {
  console.log('upvote fail', response);
});

//downvote a question
$(document).on('ajax:success', '.downvote-question', function(event, response, status, xhr) {
  console.log('downvote success', response);
  $('.votes').html('');
  $('.votes').append(response);
});

$(document).on('ajax:error', '.downvote-question', function(event, response, status, xhr) {
  console.log('downvote fail', response);
});
