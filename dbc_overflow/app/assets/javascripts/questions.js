$(document).on('ready page:load', function(){
  $('.new_question').on('submit', function(e){
    e.preventDefault();
    var data = $('.new_question').serialize();
    var url = $('.new_question').attr('action');
    var source = $('#question-template').html();
    var template = Handlebars.compile(source);

    var req = $.ajax({
      url: url,
      type: 'POST',
      data: data,
      dataType: 'JSON'
    });

    req.done(function(response){
      $('#question_list').append(template(response))
    });

    req.fail(function(data){

    });
  });


  $('a').on('click', '.fa-arrow-circle-o-up', function(e){
    e.preventDefault();
    e.stopPropagation();
    var url = $(this).parent().attr('href')

    $thisCount = $(this).parent().parent()

    var req = $.ajax({
      url: url,
      type: 'POST',
      dataType: 'JSON'
    });

    req.done(function(response) {
      $thisCount.children('.this-vote').text(response.vote_total)

    });

  });

   $('a').on('click', '.fa-arrow-circle-o-down', function(e){
    e.preventDefault();
    e.stopPropagation();
    var url = $(this).parent().attr('href')

    $thisCount = $(this).parent().parent()

    var req = $.ajax({
      url: url,
      type: 'POST',
      dataType: 'JSON'
    });

    req.done(function(response) {
      $thisCount.children('.this-vote').text(response.vote_total)

    });

  });

});
