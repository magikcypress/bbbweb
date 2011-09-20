/**
 * Simplified cross-browser AJAX interface
 * @author Eric David Benari
 * @link http://www.Vork.us
 */
var ajax = function() {}

/**
 * Retrieve content via AJAX
 *
 * @param object responseFunction
 * @param string url
 * @param Boolean isXmlResponse Optional, default is false (string response)
 * @return mixed Can be treated as Boolean for connection-success status
 */
ajax.get = function(responseFunction, url, isXmlResponse) {
	if (typeof window.XMLHttpRequest != 'undefined') {
    	ajax.req = new XMLHttpRequest();
	} else if (typeof window.ActiveXObject != 'undefined') { //IE5/5.5
	    var xobjects = ['Msxml2.XMLHTTP.6.0', 'Msxml2.XMLHTTP.3.0', 'Msxml2.XMLHTTP', 'Microsoft.XMLHTTP'];
	    while (!ajax.req && xobjects.length) {
	        try {
                ajax.req = new ActiveXObject(xobjects.shift());
            } catch(e) {}
	    }
	}
	if (ajax.req) {
		try {
		    if (navigator.appName.indexOf('Microsoft Internet Explorer') != -1) {
                url += (url.indexOf('?') < 0 ? '?' : '&') + 'rand=' + Math.random(); //IE cache fix
		    }
            ajax.req.open('GET', url, true);
            ajax.req.onreadystatechange = function() {
                if (ajax.req.readyState == 4) {
                    responseFunction(typeof isXmlResponse == 'undefined' || !isXmlResponse ?
                                     ajax.req.responseText : ajax.req.responseXML.documentElement);
                }
            };
            ajax.req.setRequestHeader('X_REQUESTED_WITH', 'XMLHttpRequest');
            ajax.req.send(null);
		} catch(e) {
		    ajax.req = false;
		}
	}
	return ajax.req;
}

/**
 * Retrieve content via AJAX
 *
 * @param string id
 * @param string url
 * @return Boolean Inverted response - false on success, true on failure - so it can be used directly as a clickhandler:
 *                 <a href="/url" onclick="ajax.load('contentbox', this.url)">...</a>
 */
ajax.load = function(id, url) {
    return (ajax.get(function(content) {document.getElementById(id).innerHTML = content;}, url) ? false : true);
}