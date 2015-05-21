// function regexTest(string){
//   return string.replace(/(\*\*|__)(.*?)\1/, "IT WORKS");
// }
$(document).ready(function(){
   $( "#markdown" ).keyup(function() { //whenever a key is pressed within the #markdown box
      $("#markdown_text").text($('#markdown').val()); //automatically updates markdown display
      // $("#markdown_text").html($('#markdown').val().replace(/(\*)+([^.*?$]+)+(\*)/gi,
      //   "<i>" + "$2"+ "</i>")); //italics
      $("#markdown_text").html($('#markdown').val().replace(/(\*\*)+([^.*?$]+)+(\*\*)/gi,
        "<b>" + "$2"+ "</b>")); //sets logic for bold replacement

        });
});


// Pseudocode:
// -We want to have a text box where people type markdown into
// -We want to display the markdown in to html
// When the rule is satisfied, then take the value and in it, replace all words
// surrounded by asterisks with words that had strong formatting.
// *word* => <strong>word</strong>

//create a form with a
