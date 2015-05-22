var ready;
ready = function() {
  $('.new_answer').on('submit', function(e) {
    e.preventDefault();
    var $form = $(this);
    $.ajax({
      type: 'post',
      url: $form.attr("action"),
      data: $form.serialize(),
      dataType: 'json'
      }
    ).done(function(response){
      $('.answer-list').prepend(response)
      $form.reset();
    })
    debugger
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
