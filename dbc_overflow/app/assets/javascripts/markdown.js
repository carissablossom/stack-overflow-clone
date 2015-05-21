// function regexTest(string){
//   return string.replace(/(\*\*|__)(.*?)\1/, "IT WORKS");
// }
$(document).ready(function(){
   $( "#markdown" ).keyup(function() { //whenever a key is pressed within the #markdown box
      $("#markdown_text").text($('#markdown').val());

  //section where we define the rules for markdown to html
   var rule_bold = new RegExp(/(\*)+([^.*?$]+)+(\*)/);



   //section where we test for presence of rules
    if (rule_bold.test($(this).val())){
      $("#markdown_text").html($('#markdown').val().replace(/(\*)+([^.*?$]+)+(\*)/,
        "<b>" + $('#markdown').val().match(/(\*)+([^.*?$]+)+(\*)/)[2]) + "</b>");
     }
   });
});


// Pseudocode:
// -We want to have a text box where people type markdown into
// -We want to display the markdown in to html
// When the rule is satisfied, then take the value and in it, replace all words
// surrounded by asterisks with words that had strong formatting.
// *word* => <strong>word</strong>

//create a form with a
