//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('page:change', function() {

    $.ajax({
        url: 'http://localhost:3000/questions/1/answers',
        type: 'get'
    }).done(function(data) {
        console.log(data);
    }).fail(function() {
        console.log('may your jimmies remain unrustled');
    });
});

$(document).ready(function(){

  $('.upvote').on('click', function(event){
    event.preventDefault()
    var id =$(this).children().attr("action")

    var response = $.ajax({
      url: id,
      type: "POST",
      dataType: "JSON",
      data: $('.upvote').children().serialize(),
    }).done(function(response){
        console.log("success")
      $('p.vote_count_'+ response.id).html(response.vote_count);
    }).fail(function(response){
      console.log(response)
    })
  })

  $('.downvote').on('click', function(event){
    event.preventDefault()
    var id =$(this).children().attr("action")
    var response = $.ajax({
      url: id,
      type: "POST",
      dataType: "JSON",
      data: $('.downvote').children().serialize(),
    }).done(function(response){
        console.log("success")
      $('p.vote_count_'+ response.id).html(response.vote_count);
    }).fail(function(response){
      console.log(response)
    })

  })

  // $('.answer_form').on('keypress', $('.answer_form').find("#answer_title"), function(){
  //   var input = $(this).val();
  //   $('.md-form').text(input);
  // })


  $('#answer_title').on('keypress', function(){
    var input = $(this).val();
    $('.md-form').find('h2').html(input);
    // debugger
  })

  $('#answer_text').on('keypress', function(){
    // var text = $(this).val('Finlandiaaaa ##banana whats up ######turtle ###asdfasdf ####oijerw!');
    var input = $(this).val().split(' ');

    markDown(input);

    $('.md-form').find('p').html(markDown(input));

    // debugger
  })

  var markDown = function(string_array){
    // var string_array = string_array.join('').split(' ')
    // debugger
    var str = '';

    for (var i=0; i < string_array.length; i++ ){
      if (string_array[i].includes("######")){
        string_array[i] = "<h6>" + string_array[i].slice(6) + "</h6>";
      } else if (string_array[i].includes("#####")){
        string_array[i] = "<h5>" + string_array[i].slice(5) + "</h5>";
      } else if (string_array[i].includes("####")){
        string_array[i] = "<h4>" + string_array[i].slice(4) + "</h4>";
      } else if (string_array[i].includes("###")){
        string_array[i] = "<h3>" + string_array[i].slice(3) + "</h3>";
      } else if (string_array[i].includes("##")){
        string_array[i] = "<h2>" + string_array[i].slice(2) + "</h2>";
      } else if (string_array[i].includes("#")){
        string_array[i] = "<h1>" + string_array[i].slice(1) + "</h1>";
      } else {
        string_array[i] = "<p>" + string_array[i] + "</p>";
      }
        str += string_array[i];
    }
    return str
  }


})






