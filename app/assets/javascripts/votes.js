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

//upvote an answer -- upvoting all answers :( needs to be fixed
// $(document).on('ajax:success', '.upvote-answer', function(event, response, status, xhr) {
//   $('.answer-votes').html('');
//   $('.answer-votes').append(response);
// });

// $(document).on('ajax:error', '.upvote-answer', function(event, response, status, xhr) {
//   console.log('upvote fail', response);
// });

//downvote an answer -- downvoting all answers :( needs to be fixed
// $(document).on('ajax:success', '.downvote-answer', function(event, response, status, xhr) {
//   console.log('downvote success', response);
//   $('.answer-votes').html('');
//   $('.answer-votes').append(response);
// });

// $(document).on('ajax:error', '.downvote-answer', function(event, response, status, xhr) {
//   console.log('downvote fail', response);
// });
