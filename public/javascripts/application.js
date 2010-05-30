// Begin processing jQuery commands after the page loads
$(function() {
  $('.datepicker').datepicker();      // Initialize the date picker elements
//  $('.timepicker').datetime({userLang:'en',americanMode:true});


  //  UIInit();                       // Set up the user interface components
  tabInit();                      // Initialize the tab elements
  tableInit();                      // Initialize the tab elements
  //  accordionInit();                // Initialize the accordian elements
  //  calculatorInit();               // Initialize the calculator elements
  //  thickboxInit();                 // Initialize the ThinkBox elements
  $('textarea[title!=""],input[title!=""]').hint();   // Show input 'hints'
  $("input.focus:last").focus();  // Set the focus on the last input tag with a class of "focus"
});


function tabInit(){
  $("#tabs").tabs({
    //cookie: {expires: 1}
    });
}

function tableInit(){
  $('table').dataTable({
		"bJQueryUI": true
    ,"bPaginate": false
    ,"bSearch": false
    ,"bFilter": false
    ,"bInfo": false
//    ,"bSort": false

	});
}