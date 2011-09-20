/**
 * Popup simplifies generating pop up windows
 * @author Eric David Benari
 * @link http://www.Vork.us

Documentation for the popup function:

Usage example:
popup('/myPageToPopOpen', {'height': 300, 'width': 500});

When multiple popups will use the same properties you can set defaults via syntax:
popup.height = 300;
popup.width = 500;
popup('/url1');
popup('/url2', {'left': 200, 'top': 250});

All default properties can be overridden by inline definitions:
popup.focus = 1;
popup('/url3'); //this will pop in the foreground and take focus
popup('/url4', {'blur': true}); //this will pop in the background


The following optional properties are available:
blur - (Boolean) sets the popup to open behind the current window
focus - (Boolean) sets the popup to take focus once it opens

center - (Boolean) centers the popup on the screen
centerx - (Boolean) centers the popup horizontally on the screen
centery - (Boolean) centers the popup vertically on the screen

id - this is the internal name for the popup, if you open two popups with the same ID the second one will load
     in the window of the first. This is used as the second argument to window.open()
replace - (Boolean) if true then the new location will replace the current page in the browser's navigation history
          Note: many browsers do this anyway. if supplied, this is used as the fourth argument to window.open().

returnobject - (Boolean) if Boolean true then the window.open object is returned instead of executed. This grants you
total control over the window, allowing you to do things like:
var pop = popup('/somePage', {'returnobject': true});
setTimeout('closepop(pop)', 2000);

If returnobject is not defined or is set to false then the return value of popup() will be Boolean false, this is for
convenience as it allows you to easily make pop-ups that degrade gracefully and become ordinary links if JavaScript
is turned off:
<a href="/myPage" onclick='return popup(this.href)'">

The following properties are also valid and are the arguments built into JavaScript for the window.open function:
height, width,
outerheight, outerwidth,
innerheight, innderwidth,
left, top,
screenx, screeny,
alwayslowered, alwaysraised,
channelmode, copyhistory, dependent, directories, fullscreen, hotkeys,
location, menubar, resizable, scrollbars, status, toolbar, z-lock
 */
var validproperties = [ 'height', 'width',
                        'outerheight', 'outerwidth',
                        'innerheight', 'innderwidth',
                        'left', 'top',
                        'screenx', 'screeny',
                        'alwayslowered', 'alwaysraised',
                        'channelmode', 'copyhistory', 'dependent', 'directories', 'fullscreen', 'hotkeys',
                        'location', 'menubar', 'resizable', 'scrollbars', 'status', 'toolbar', 'z-lock'];
/**
 * Calculates the top or left position of a centered window based on the size of the popup
 *
 * @param string returnLeftOrTop Valid values are 'left' and 'top'
 * @param int popupSize
 * @return int
 */
/* protected */ function _getCenterStartingPosition(returnLeftOrTop, popupSize) {
	var screenSize = (returnLeftOrTop.toLowerCase() == 'top' ? screen.height : screen.width);
	var remainingRealEstate = screenSize - popupSize;
	if (remainingRealEstate < 0) {
		remainingRealEstate = 0;
	}
	return (remainingRealEstate / 2);
}

/**
 * Calculates the outerwidth of a window based on the innerwidth
 *
 * @param string returnWidthOrHeight Valid values are 'width' and 'height'
 * @param int popupInnerSize
 * @return int
 */
/* protected */ function _getOuterFromInner(returnWidthOrHeight, popupInnerSize) {
	var borderSize = (returnWidthOrHeight.toLowerCase() == 'height' ? (window.outerHeight - window.innerHeight)
	                                                                : (window.outerWidth - window.innerWidth));
	if (borderSize < 0) {
		borderSize = 0;
	}
	return (borderSize + popupInnerSize);
}

/**
 * Adds the correct positioning dimensions to the optionsArray to open a popup centered on the screen
 *
 * @param object optionsArray
 * @param object popupObject
 * @param object properties
 * @return object optionsArray
 */
/* protected */ function _getCenterDimensions(optionsArray, popupObject, properties) {
	var width = 640; //these are default values used only when centering a popup without defined dimensions
	var height = 480;
	var centerPropertiesArray = new Object;
	var checkproperties = (typeof properties != 'undefined');
	var centerxRequested = false, centeryRequested = false, centerx = false, centery = false
	var definedLeft = false, definedTop = false;
	var definedCenterx = false, definedCentery = false;

	var centerProperties = ['center', 'centerx', 'centery'];
	centerPropertiesLength = centerProperties.length;
    for (var x = 0; x < centerPropertiesLength; x++) {
        if (checkproperties && typeof properties[centerProperties[x]] != 'undefined'
        	&& properties[centerProperties[x]] != null) {
        	centerPropertiesArray[centerProperties[x]] = properties[centerProperties[x]];
        } else if (typeof popupObject[centerProperties[x]] != 'undefined'
        		   && popupObject[centerProperties[x]] != null) {
        	centerPropertiesArray[centerProperties[x]] = popupObject[centerProperties[x]];
        }
    }

	if (typeof centerPropertiesArray['center'] != 'undefined' && centerPropertiesArray['center']) {
		centerxRequested = true;
		centeryRequested = true;
	} else {
		centerxRequested = (typeof centerPropertiesArray['centerx'] != 'undefined'
							&& centerPropertiesArray['centerx']);
		centeryRequested = (typeof centerPropertiesArray['centery'] != 'undefined'
							&& centerPropertiesArray['centery']);
	}

	if (checkproperties) {
		//left/top entered inline overwrites center request
		definedLeft = (typeof properties['left'] != 'undefined' && properties['left'] != null);
		definedTop = (typeof properties['top'] != 'undefined' && properties['top'] != null);
		if (!definedLeft && typeof properties['screenx'] != 'undefined' && properties['screenx'] != null) {
			definedLeft = true;
		}
		if (!definedTop && typeof properties['screeny'] != 'undefined' && properties['screeny'] != null) {
			definedTop = true;
		}
	}
	//center written either inline or instance-scope overrides left/top defined at the instance-scope
	centerx = (!definedLeft && centerxRequested);
	centery = (!definedTop && centeryRequested);

	if (centerx) {
		if (typeof optionsArray['width'] != 'undefined') {
			width = optionsArray['width'];
		} else if (typeof optionsArray['outerwidth'] != 'undefined') {
			width = optionsArray['outerwidth'];
		} else if (typeof optionsArray['innerwidth'] != 'undefined'
				   && typeof window.outerWidth != 'undefined') {
			width = _getOuterFromInner('width', optionsArray['innerwidth']);
		} else {
			optionsArray['width'] = width;
		}
		optionsArray['left'] = _getCenterStartingPosition('left', width);
	}

	if (centery) {
		if (typeof optionsArray['height'] != 'undefined') {
			height = optionsArray['height'];
		} else if (typeof optionsArray['outerheight'] != 'undefined') {
			height = optionsArray['outerheight'];
		} else if (typeof optionsArray['innerheight'] != 'undefined'
				   && typeof window.outerHeight != 'undefined') {
			height = _getOuterFromInner('height', optionsArray['innerheight']);
		} else {
			optionsArray['height'] = height;
		}
		optionsArray['top'] = _getCenterStartingPosition('top', height);
	}
	return optionsArray;
}

/**
 * Opens popups
 *
 * @param string url
 * @param object properties
 * @return mixed
 */
/* public */ function popup(url, properties) {
    var popup;
    var popupname = '';
    var optionsArray = new Object;
    var options = '';
    var validpropertieslength = validproperties.length;
    var checkproperties = (typeof properties != 'undefined');

    for (var x = 0; x < validpropertieslength; x++) {
        if (checkproperties && typeof properties[validproperties[x]] != 'undefined'
        	&& properties[validproperties[x]] != null) {
        	optionsArray[validproperties[x]] = properties[validproperties[x]];
        } else if (typeof this.popup[validproperties[x]] != 'undefined'
        		   && this.popup[validproperties[x]] != null) {
        	optionsArray[validproperties[x]] = this.popup[validproperties[x]];
        }
    }
	if (typeof optionsArray['width'] == 'undefined' && typeof optionsArray['outerwidth'] != 'undefined'
		&& typeof window.outerWidth == 'undefined') {
		optionsArray['width'] = optionsArray['outerwidth'];
	}
	if (typeof optionsArray['height'] == 'undefined' && typeof optionsArray['outerheight'] != 'undefined'
		&& typeof window.outerHeight == 'undefined') {
		optionsArray['height'] = optionsArray['outerheight'];
	}

    if (checkproperties) {
    	optionsArray = _getCenterDimensions(optionsArray, this.popup, properties);
    } else {
    	optionsArray = _getCenterDimensions(optionsArray, this.popup);
    }

    for (var option in optionsArray) {
        if (options != '') {
            options += ', ';
        }
        options += option + '=' + optionsArray[option];
    }

    if (checkproperties && typeof properties['id'] != 'undefined') {
        popupname = properties['id'];
    } else if (typeof this.popup.id != 'undefined') {
        popupname = this.popup.id;
    }

    if (checkproperties && typeof properties['replace'] != 'undefined') {
        var popupreplace = properties['replace'];
    } else if (typeof this.popup.replace != 'undefined') {
        var popupreplace = this.popup.replace;
    }

    if (typeof popupreplace == 'undefined') {
        popup = window.open(url, popupname, options);
    } else {
        popup = window.open(url, popupname, options, popupreplace);
    }

    if (typeof popup != 'undefined' && popup) {//this prevents errors if the client has popups blocked
        if (checkproperties && typeof properties['focus'] != 'undefined' && properties['focus']) {
            popup.focus();
        } else if (checkproperties && typeof properties['blur'] != 'undefined' && properties['blur']) {
            popup.blur();
        } else if (typeof this.popup.focus != 'undefined' && this.popup.focus) {
    	    popup.focus();
    	} else if (typeof this.popup.blur != 'undefined' && this.popup.blur) {
    	    popup.blur();
    	}
    }

	if ((checkproperties && typeof properties['returnobject'] != 'undefined' && properties['returnobject'])
		 || (typeof this.popup.returnobject != 'undefined' && this.popup.returnobject)) {
		return popup;
	} else {
		return false;
	}
}

/**
 * Closes popups
 *
 * @param object popupObject Optional window object to be closed, if omitted then the current window will close
 */
/* public */ function closepop(popupObject) {
	if (typeof popupObject == 'undefined') {
		popupObject = this;
	}
	popupObject.close();
}