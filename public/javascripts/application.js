// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function hide_drop_menus() {
  var elements = $$('.drop_menu')
  if (elements) {
    elements.each( function(element) {element.style.display = 'none';});
  }
}