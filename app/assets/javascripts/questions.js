$(document).on('page:change', function(){
  $('.question_form').on('submit', function(e){
    e.preventDefault();
    console.log('we are in the form');

    var formData = {"question" : {'title': $('#question_title').val(),
                                  'content': $('#question_content').val()}};

    $.ajax({
      url: '/questions',
      type: 'post',
      data: formData,
      dataType: 'json'
    }).done(function(data){
      console.log(data)
      $('.question_form').hide();
    });
  });
})
