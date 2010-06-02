// Begin processing jQuery commands after the page loads
$(function() {
  tableInit();                      // Initialize the tab elements
  $('textarea[title!=""],input[title!=""]').hint();   // Show input 'hints'
  //  $('.timepicker').datetime({userLang:'en',americanMode:true});

  tabInit();                      // Initialize the tab elements
  $('.wysiwyg').wysiwyg();
  $("button, input:submit").button();

  autocompleteInit();
  $('.datepicker').datepicker();      // Initialize the date picker elements
  $("input.focus:last").focus();  // Set the focus on the last input tag with a class of "focus"
});


function autocompleteInit(){
  $('input.autocomplete').each(function(index){
    $(this).autocomplete({
      source: $(this).attr('data-autocomplete-url'),
      select: function(event, ui) {
      //        alert('you chose: ' + ui.item.value)
      },
      minLength: 3
    });
  });
}

function tabInit(){
  $("#tabs").tabs({
    //cookie: {expires: 1}
    });
}

function tableInit(){
  $('table').dataTable({
    "bJQueryUI": true,
    "bPaginate": false,
    "bSearch": false,
    "bFilter": false,
    "bInfo": false,
    "bAutoWidth": false
  //"bSort": false
  });
}
