$(document).ready(function() {

  $('#new_answer').on('submit', function(event) {
    event.preventDefault();

    var source = $('#answer_block').html();
    var template = Handlebars.compile(source);

    var url = $(this).attr('action');
    var data = $(this).serialize();
    var request = $.ajax({
      type: 'post',
      url: url,
      data: data,
      dataType: 'json'
    });

    request.done(function(data) {
      var context = {};
      context.data = data;
      $('.answer_div').append(template(context));
    });

    request.fail(function(data){
      console.log("we failed");
    });

  });
});
