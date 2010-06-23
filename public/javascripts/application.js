// Begin processing jQuery commands after the page loads
$(function() {
  $('#switcher').themeswitcher();   // FIXME: Temporary
  pageRefresh();

  tabInit();                      // Initialize the tab elements
  
  tableInit();    // Set up the tables on the page
  searchInit();   // Set up the search functionality on the page

  pageInit();     // Set up general page things: Ajax, BlockUI, etc.
});

function pageRefresh(){
  $('textarea[title!=""],input[title!=""]').hint();   // Show input 'hints'
  //  $('.timepicker').datetime({userLang:'en',americanMode:true});
  $('.datepicker').datepicker();      // Initialize the date picker elements
  $('.wysiwyg').wysiwyg();
  $("input.focus:last").focus();  // Set the focus on the last input tag with a class of "focus"
}

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
  // Open a dialog box for editing table rows
  $('.dataTable tbody tr')
  .click(function(e) {
    form = $("#dialog-form");
    form.html("");                                                            // Clear out the old stuff
    $.get($(this).attr('data-dialog-url'), '', null, 'script');               // Load the new content
    form.dialog( "option", "height", form.attr("data-dialog-height") || 500 );// Set the dialog box width
    form.dialog('open');                                                      // And finally open the dialog box
    return false;
  });

  // Style the table
  $(".dataTable tbody tr").css("cursor", "pointer")
  .hover(
    function() {
      $(this).addClass('ui-state-highlight')
    },
    function() {
      $(this).removeClass('ui-state-highlight')
    }
    )
}

function pageInit(){
  // Set up the accordion structure
  //    $(".accordion").accordion();

  // Configure BlockUI
  $.blockUI.defaults.baseZ = '9999';
  $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);

  // Configure the jQueryUI dialog box
  $("#dialog-form").dialog({
    autoOpen: false,
    height: 500,
    width: 800,
    modal: true,
    resizeable: false,
    title: $('#dialog-form').attr('data-dialog-title')
  });
}

// Private functions
// ====================================
var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();
