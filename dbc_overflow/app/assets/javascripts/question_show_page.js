$(document).on("page:change", function(){
//   $('.new_question').on('submit', function(e){
//     e.preventDefault();
//     var data = $('.new_question').serialize();
//     var url = $('.new_question').attr('action');
//     var source = $('#question-template').html();
//     var template = Handlebars.compile(source);

//     var req = $.ajax({
//       url: url,
//       type: 'POST',
//       data: data,
//       dataType: 'JSON'
//     });

//     req.done(function(response){
//       $('#question_list').append(template(response))
//     });

//     req.fail(function(data){

//     });
//   });


  $(".vote-up-answer").on('click', '.fa-arrow-circle-o-up', function(e){
    console.log("hey")
    debugger
    e.preventDefault();
    e.stopPropagation();
    var url = $(this).parent().attr('href')

    $thisCount = $(this).parent().parent()
    debugger
    var req = $.ajax({
      url: url,
      type: 'GET',
      dataType: 'JSON'
    });

    req.done(function(response) {
      debugger
      $thisCount.children('.this-vote').text(response.vote_total)

    });

  });

//    $('a').on('click', '.fa-arrow-circle-o-down', function(e){
//     e.preventDefault();
//     e.stopPropagation();
//     var url = $(this).parent().attr('href')

//     $thisCount = $(this).parent().parent()

//     var req = $.ajax({
//       url: url,
//       type: 'GET',
//       // dataType: 'JSON'
//     });

//     req.done(function(response) {
//       debugger
//       var body = $(response).find('#question_list').html();
//       $(document).find('#question_list').replaceWith(body)

//       //this will replace the #question_list originally on the document with the appropriate div..
//       //this is only reworked for downvotes at the moment. Requires requesting html by default
//     });

//   });

});
