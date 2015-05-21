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


$('#question_title').on('keyup', function(event){
    var input = $('#question_title').val();
    var myString = input;
    var regEx = /([^a-zA-Z0-9]){1,}/;
    var rest = /([a-zA-Z0-9\s\d]{1,})/;
    var match = regEx.exec(myString);
    var theRest = rest.exec(input);
    var count = 0;

    var markdown_1 = match[0]
    var markdown_2 = theRest[0]

    var h1 = $('<h1></h1>')
    var h2 = $('<h6></h6>')
    var ul = $('<ul></ul>')
    var blockquote = $('<blockquote></blockquote>')



      if (markdown_1 === "#") {
        var tag = h1
        h1.append(markdown_2);
        $('.markdown_line').html(h1);
        count+=1 ;
      } else if (markdown_1 === "##") {
          var tag = h2
          h2.append(markdown_2);
          $('.markdown_line').html(h2);
          count+=1 ;
      } else if (markdown_1 === "*" || markdown_1 === "-" ) {
          var tag = ul
          ul.append(markdown_2);
          $('.markdown_line').html(ul);
          count+=1;
      } else if (markdown_1 === ">") {
          var tag = blockquote
          blockquote.append(markdown_2);
          $('.markdown_line').html(blockquote);
          count+=1 ;
      } else {
          if (count !== 0) {
            tag.append(markdown_2);
            $('.markdown_line').html(tag);
          } else if (count === 0) {
            $('.markdown_line').html(markdown_2);
          }
        }
      });






  })


