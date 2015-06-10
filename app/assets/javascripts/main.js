$(document).on('page:change',function() {
  console.log('READY')

  $('form').on('click', '.add_answer', function(e){
    e.preventDefault();
    var form = $('form.new_answer');
    $.ajax({
      url: form.attr('action'),
      type: form.attr('method'),
      data: form.serialize(),
      dataType: 'json'
    })
    .done(function(response){
      console.log(response);
      var test = $('#answer_template').html();
      var template = Handlebars.compile(test);
      $('#answer_content').val('');
      $('.answer_container').append(template(response));
    })
    .fail(function(response){
      alert('Fail');
    })
  })

  $('.new_question').on('click', '.new_question_link', function(e){
    $('.hidden').css('display', 'block');
    $('.new_question_link').hide();
  })

  $('.new_question').on('click', '.submit_question', function(e){
    e.preventDefault();

    var form = $(this).parent().parent();
    $.ajax({
      type: form.attr('method'),
      url: form.attr('action'),
      data: form.serialize()
    })
    .done(function(response){
      $('.list_questions').append(response);
      $('.hidden').css('display','none');
      $('#question_title').val('');
      $('#question_content').val('');
      $('.new_question_link').show();
    })
    .fail(function(response){
      alert('Fail');
    })
  })

  $('.answer_container').on('click', '.vote_answers', function(e){
    e.preventDefault()
    var _this = $(this);

    $.ajax({
      url: $(this).parent().attr('action'),
      type: 'POST',
      dataType: 'json'
    })
    .done(function(response){
      $(_this).parent().parent().siblings('.votes').html("Votes: " + response)
      // $(_this).parent().prev().html("Votes: " + response)
    })
    .fail(function(response){
      alert('Fail');
    })
  })

  $('.vote_questions').on('click', function(e) {
    e.preventDefault();

    $.ajax({
      url: $(this).closest('.vote_questions').parent().attr('action'),
      type: 'POST',
      dataType: 'json'
    })
    .done(function(response) {
      $('.question_votes').html(response)
    })
    .fail(function(response) {
      alert('fail!')
    })
  })

})

