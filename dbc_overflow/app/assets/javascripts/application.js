//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

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
    $('.md-form').find('h2').text(input);
    // debugger
  })

  $('#answer_text').on('keypress', function(){
    var text = $(this).val('##banana, ######turtle, asdfasdf');
    var input = $(this).val().split(' ');

      markDown(input);

    // $('.md-form').find('p').text(input);

    debugger
  })

  var markDown = function(string_array){
    // debugger
    var str = '';

    for (var i=0; i < string_array.length; i++ ){
      if (string_array[i].includes("######")){
        string_array[i] = "<h6>" + string_array[i].slice(6) + "</h1>"
      } else if (string_array[i].includes("#####")){
        string_array[i] = "<h5>" + string_array[i].slice(5) + "</h1>"
      } else if (string_array[i].includes("####")){
        string_array[i] = "<h4>" + string_array[i].slice(4) + "</h1>"
      } else if (string_array[i].includes("###")){
        string_array[i] = "<h3>" + string_array[i].slice(3) + "</h1>"
      } else if (string_array[i].includes("##")){
        string_array[i] = "<h2>" + string_array[i].slice(2) + "</h1>"
      } else if (string_array[i].includes("#")){
        string_array[i] = "<h1>" + string_array[i].slice(1) + "</h1>"
      }
        str += string_array[i]
    }
    return str
  }




})






