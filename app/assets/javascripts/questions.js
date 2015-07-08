// append question form
$(document).on('ajax:success', '.add-question-link', function(event, response) {
  $('.add-question-link').hide();
  $('.add-question-form').append(response);
});

$(document).on('ajax:error', '.add-question-link', function(event) {
  console.log('load question form fail', arguments);
});

// append new question
$(document).on('ajax:success', '.new_question', function(event, response, status, xhr) {
  $('body').append(response); //needs to be cleaned up
});

$(document).on('ajax:error', '.new_question', function(event, response, status, xhr) {
  console.log('new question fail', arguments);
});
