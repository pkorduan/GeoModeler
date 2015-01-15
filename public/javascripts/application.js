// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function toggleChildElements(element) {
	if (element.alt == "show") {
	  element.src = "/images/icons/minus_icon.png";
    element.alt = "hide";
		element.ancestors()[0].childElements().each(function(childElement) { if (childElement.className != "data") childElement.show(); });
	}
	else {
    element.src = "/images/icons/plus_icon.png";
		element.alt = "show";
	  element.ancestors()[0].childElements().each(function(childElement) { if (childElement.tagName == "DIV") childElement.hide(); });
	}
}

function toggleSelected(element) {
	if (element.getStyle("background-color")=="rgb(255, 255, 255)") {
	  element.setStyle("background-color:#B6D2FC");
	}	
	else {
	  element.setStyle("background-color:#FFFFFF");	
	}
}

function searchForElement(element_name) {
  var results = [];
	$('searchResults').innerHTML='';
  $$('div').each(function(element) {
	  if (element.readAttribute('name') && element_name.strip().length > 3 && element.readAttribute('name').toLowerCase().include(element_name.strip().toLowerCase())) {
		  results.push(element);
		}
	});
	var num_results = results.length;
	if (num_results == 0) {
	  $('searchResults').innerHTML='nichts gefunden oder Text zu kurz';
	}
	else {
	  showSearchResultSelector(results);
	}
}

function showSearchResultSelector(results) {
  var html='';
	for (var i=0; i < results.length; i++) {
	  ancestor = results[i].ancestors()[0];
	  html +=results[i].readAttribute('alt')
		     +": "
				 +"<a href=\"#"+results[i].id+"\" onclick=\"showSearchResult($('"+results[i].id+"'))\">"
		     +results[i].readAttribute('name')
				 +"</a> in "
				 +ancestor.readAttribute('alt')
				 +": "
				 +"<a href=\"#"+ancestor.id+"\" onclick=\"showSearchResult($('"+ancestor.id+"'))\">"
		     +ancestor.readAttribute('name')
				 +"</a> "				 
				 +"<br>";
	}
	$('searchResults').innerHTML=html;
	$('searchResultBox').show();
}

function showSearchResult(element) {
	openAncestors(element);
	focusElement(element);
}

function focusElement(element) {
	resetBackground();
  element.setStyle("background-color:#B6D2FC");
	element.scrollTo();
/*	element.childElements().each(function(element) {
	  element.setStyle({
			backgroundColor: "#CCCCFF"
		});
	}); */
}

function resetBackground() {
  $$('div.content').each(function(element) {
    element.setStyle("background-color:#FFFFFF");
	});
}

function openAncestors(element) {
	element.ancestors().each(function(parent) {
	  if (parent.tagName == "DIV" && parent.id != 'tree') {
 		  showChildElements(parent);
		}	
	});
}

function showChildElements(element) {
	element.childElements().each(function(childElement) {
  	if (childElement.className != "data") showElement(childElement);
	});
}

function showElement(element) {
  if (element.tagName == "IMG" && element.alt == 'show') {
	  element.src = "/images/icons/minus_icon.png";
    element.alt = "hide";
	}	
	element.show();
}

function hideElement(element) {
    element.src = "/images/icons/plus_icon.png";
		element.alt = "show";
	  element.ancestors()[0].childElements().each(function(childElement) { if (childElement.tagName == "DIV") childElement.hide(); });
}
