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


  // $('#answer_title').keyup(function(){
  //   debugger
  //   // $('#answer.text').css()

  // })
  })
