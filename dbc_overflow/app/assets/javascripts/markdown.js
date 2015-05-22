// function regexTest(string){
//   return string.replace(/(\*\*|__)(.*?)\1/, "IT WORKS");
// }
$(document).ready(function(){
  // On document ready runs this function

   $( "#markdown" ).keyup(function() { //whenever a key is pressed within the #markdown box
      $("#markdown_text").text($('#markdown').val());
      // Selects the #markdown which is on the left.  Listens for keyup and on key up does this
      // function.  The function grabs the markdown text class on the right and gives it the
      // text value from the markdown on the left.



       //automatically updates markdown display
      $("#markdown_text").html($('#markdown').val().replace(/(\*\*)+([^.*?$]+)+(\*\*)/gi,
        "<b>" + "$2"+ "</b>").replace(/(\*)+([^.*?$]+)+(\*)/gi,
        "<i>" + "$2"+ "</i>")); //sets logic for bold replacement
      // Now this selects the markdown text on the right and gives it the value of the markdown on the
      // right once it has had the middle value found by the regex expression replaced with a
      // html things.  Why can't you chain to the end of this?
        });
});


// Pseudocode:
// -We want to have a text box where people type markdown into
// -We want to display the markdown in to html
// When the rule is satisfied, then take the value and in it, replace all words
// surrounded by asterisks with words that had strong formatting.
// *word* => <strong>word</strong>

//create a form with a
