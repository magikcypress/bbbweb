/**
 * Simplifies working with cookies
 * @author Eric David Benari
 * @link http://www.Vork.us
 */
var cookie = function() {}

/**
 * Sets a cookie
 *
 * @param string name
 * @param string value
 * @param mixed expires Optional Can be an int (number of days) or smart string eg.: 3 hours, 6 weeks, 1 year, etc.
 * @param obj args Optional, a JavaScript object with keys for any or all of: domain, host or (Boolean) secure
 */
cookie.write = function(name, value, expires, args) {
	var cookie = name + '=' + escape(value);
	if (typeof expires != 'undefined') {
		var increment = (24 * 60 * 60 * 1000); //days
		if (typeof expires == 'string') {
    		if (expires.indexOf('minute') != -1) {
    		    increment = 60000;
    		} else if (expires.indexOf('hour') != -1) {
    		    increment /= 24;
    		} else if (expires.indexOf('week') != -1) {
    		    increment *= 7;
    		} else if (expires.indexOf('month') != -1) {
    		    increment *= 30;
    		} else if (expires.indexOf('year') != -1) {
    		    increment *= 365;
    		}
    		expires = parseInt(expires);
		}
		var date = new Date();
		date.setTime(date.getTime() + (expires * increment));
		cookie += '; expires=' + date.toGMTString();
	}
	if (typeof args != 'undefined') {
    	var argTypes = ['path', 'domain']
    	for (argType in argTypes) {
        	if (typeof args[argTypes[argType]] != 'undefined') {
        	    cookie += '; ' + argTypes[argType] + '=' + args[argTypes[argType]];
        	}
    	}
    	if (typeof args['secure'] != 'undefined') {
    	    cookie += '; secure';
    	}
	}
	document.cookie = cookie;
}

/**
 * Reads a cookie
 *
 * @param string name
 * @return mixed Returns the cookie string; if the cookie is not set it returns null
 */
cookie.read = function(name) {
    if (document.cookie.length > 0) {
        var start = document.cookie.indexOf(name + '=');
        if (start != -1) {
            start += name.length + 1;
            var end = document.cookie.indexOf(';', start);
            if (end == -1) {
                end = document.cookie.length;
            }
            return unescape(document.cookie.substring(start, end));
        }
    }
	return null;
}

/**
 * Removes a cookie
 *
 * @param string name
 */
cookie.unset = function(name) {
	cookie.write(name, null, -1);
}