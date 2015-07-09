//upvote a question
$(document).on('ajax:success', '.upvote-question', function(event, response, status, xhr) {
  console.log('upvote success', response);
});

$(document).on('ajax:error', '.upvote-question', function(event, response, status, xhr) {
  console.log('upvote fail', response);
});
