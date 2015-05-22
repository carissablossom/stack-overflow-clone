var ready;
ready = function() {
  $('.new_question').on('submit', function(e) {
    e.preventDefault();
    var $form = $(this);
    $.ajax({
      type: 'post',
      url: $form.attr("action"),
      data: $form.serialize(),
      dataType: 'json'
      }
    ).done(function(response){
      $('.question-list').prepend(response)
      $form[0].reset();
    })
    // debugger
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
