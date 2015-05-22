$(function(){

var previewTitle = function(key){
  var mimic = $(this).val()
  $('.preview h2').text(mimic)
}

var previewContent = function(key){
 code = key.keyCode
 var mimic = $(this).val()

 if (code === 13){
  $('.preview p').text(mimic)
 }
 else
  $('.preview p').text(mimic)
}

  $("#question_title").on('keyup', previewTitle)
  $("#question_content").on('keyup', previewContent)

});

