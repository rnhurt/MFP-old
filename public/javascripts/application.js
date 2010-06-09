// Begin processing jQuery commands after the page loads
$(function() {
  tableInit();                      // Initialize the table elements
  $('textarea[title!=""],input[title!=""]').hint();   // Show input 'hints'
  //  $('.timepicker').datetime({userLang:'en',americanMode:true});

  tabInit();                      // Initialize the tab elements
  $('.wysiwyg').wysiwyg();
  $("button, input:submit").button();

  $(".accordion").accordion();
  $('.datepicker').datepicker();      // Initialize the date picker elements
  $("input.focus:last").focus();  // Set the focus on the last input tag with a class of "focus"
  searchInit();
});


function searchInit(){
  $('input.search').keyup(function() {
    element = $(this);
    delay(function(){
      data = element.val();
      url = element.attr('data-search-url');
      if (data.length > 2) {
        $.get(url, "term="+data, null, 'script');
      }
    }, 750 );
  });
}

function tabInit(){
  $("#tabs, #vtabs").tabs({
    //cookie: {expires: 1}
    });
  $("#vtabs").tabs().addClass('ui-tabs-vertical ui-helper-clearfix');
  $("#vtabs li").removeClass('ui-corner-top').addClass('ui-corner-left');
}


function tableInit(){
  $('.dataTable').dataTable({
    "bJQueryUI": true,
    "bPaginate": false,
    "bSearch": false,
    "bFilter": false,
    "bInfo": false,
    "bAutoWidth": false
  //"bSort": false
  });
}

var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();
