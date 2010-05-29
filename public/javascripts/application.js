// Begin processing jQuery commands after the page loads
$(function() {
//  $('#date').datepicker();          // Initialize the date picker elements

  //  UIInit();                       // Set up the user interface components
  tabInit();                      // Initialize the tab elements
  //  accordionInit();                // Initialize the accordian elements
  //  calculatorInit();               // Initialize the calculator elements
  //  thickboxInit();                 // Initialize the ThinkBox elements
  $("input.focus:last").focus();  // Set the focus on the last input tag with a class of "focus"
});


function tabInit(){
  $("#tabs").tabs({
    //cookie: {expires: 1}
  });
}