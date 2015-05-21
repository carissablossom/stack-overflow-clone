$(document).ready(function() {

  $('.new_question').keyup(function(){
    $('.markdown').css('display', 'inline')
    var lines = $(this).find('[name="question[content]"]').val().split('\n');
    // console.log(lines)
    // h tags
    for (i = 0; i < lines.length; i++) {
      for (x = 6; x > 0; x -= 1) {
        if (lines[i].substring(0,x) === Array(x+1).join("#")) {
          lines[i] = "<h" +x+ ">" +lines[i].slice(x)+ "</h" +x+ ">";
        }
      }
    }
    // bold and italics
    for (i = 0; i < lines.length; i++) {
      console.log(lines[i])
      if (lines[i].substring(0,2) === "**" && lines[i].substring(lines[i].length-2, lines[i].length)=== "**") {
        lines[i] = "<strong>" + lines[i].slice(2, -2) + "<strong>"
      } else if (lines[i].substring(0,1) === "*" && lines[i].substring(lines[i].length-1, lines[i].length)=== "*") {
        lines[i] = "<em>" + lines[i].slice(1, -1) + "<em>"
      }
    }
    // links
    for (i = 0; i < lines.length; i++) {
      if (lines[i].substring(0,1) === "[" && lines[i].substring(lines[i].length-1, lines[i].length)=== ")") {
        var array = lines[i].split("(")
        var content = array[0].slice(1,-1)
        var link = array[1].slice(0,-1)
        lines[i] = '<a href="' +link+ '">' +content+ '</a>'
      }
    }

    $('.markdown').val(lines)
  });

});

