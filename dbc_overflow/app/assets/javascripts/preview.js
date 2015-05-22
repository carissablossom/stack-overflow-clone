$(function(){

var previewTitle = function(key){
  var mimic = $(this).val()
  $('.preview h2').text(mimic)
}

var previewContent = function(key){
 // code = key.keyCode
 $('.preview div').children().remove();
 var mimic = $(this).val()

 var strings = mimic.split("\n");
 console.log(strings);

for (var i = 0; i < strings.length; i++)
  $('.preview div').append('<p>'+strings[i]+'<p>')
}

  $("#question_title").on('keyup', previewTitle)
  $("#question_content").on('keyup', previewContent)

});

