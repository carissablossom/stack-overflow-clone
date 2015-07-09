// add new answer
$(document).on('ajax:success', '.new_answer', function(event, response, status, xhr) {
  console.log('new answer success', response);
  $('.show-answer').append(response);
});

$(document).on('ajax:error', '.new_answer', function(event, response, status, xhr) {
  console.log('new answer fail', arguments);
});
