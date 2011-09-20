/**
 * Phonetic-Typing System - multilingual forms allow users to easily type characters in other alphabets by pressing the phonetically-equivalent English keys
 * This file MUST be saved as a UTF-8 text file; saving in Latin or another character set will permanently destroy the character maps.
 * @author Eric David Benari
 * @link http://www.Vork.us
 */
 
 /**
 * Activates the i18n system
 * @param str ids Optional, a string or an array of strings containing the id(s) of form inputs/textareas to enable use of i18n - if omitted all textareas and text-inputs will be i18n activated
 */
/* public */ var i18n = function(ids) {
    i18n.initialized = true;
    if (typeof ids != 'undefined') {
        if (typeof ids != 'object') {
            ids = [ids];
        }
        var thisid;
        for (var i in ids) {
            thisid = document.getElementById(ids[i]);
            if (thisid) {
                thisid.onkeypress = i18n.keyPressed;
            }
        }
    } else {
        var textareas = document.body.getElementsByTagName('textarea');
        for (var i = 0; i < textareas.length; i++) {
            textareas[i].onkeypress = i18n.keyPressed;
        }
        var inputs = document.body.getElementsByTagName('input');
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].type == 'text') {
                inputs[i].onkeypress = i18n.keyPressed;
            }
        }
    }
    if (typeof i18n.langs == 'undefined') {
        i18n.setLanguages();
    }
}

 /**
 * Name of the current language
 * @var string
 */
/* protected */ i18n.languageName = 'english';
 
 /**
 * Current language
 * @var mixed English is a string, other languages are an object
 */
/* protected */ i18n.language = 'english';

 /**
 * Language mappings
 * @var object
 */
/* protected */ i18n.languages = {
'russian': {'a':'а', 'b':'б', 'c':'ц', 'd':'д', 'e':'е', 'f':'ф', 'g':'г', 'h':'ч', 'i':'и', 'j':'ж', 
'k':'к', 'l':'л', 'm':'м', 'n':'н', 'o':'о', 'p':'п', 'q':'ё', 'r':'р', 's':'с', 't':'т', 'u':'у', 'v':'в', 
'w':'ю', 'x':'х', 'y':'я', 'z':'з', 
'[':'ш', ']':'щ', "'":'ь', '`':'ъ', '=':'й', '-':'ы', '\\':'э',
'A':'А', 'B':'Б', 'C':'Ц', 'D':'Д', 'E':'Е', 'F':'Ф', 'G':'Г', 'H':'Ч', 'I':'И', 'J':'Ж',
'K':'К', 'L':'Л', 'M':'М', 'N':'Н', 'O':'О', 'P':'П', 'Q':'Ё', 'R':'Р', 'S':'С', 'T':'Т', 
'U':'У', 'V':'В', 'W':'Ю', 'X':'Х', 'Y':'Я', 'Z':'З', 
'{':'Ш', '}':'Щ', '"':'Ь', '~':'Ъ', '+':'Й', '_':'Ы',  '|':'Э'},
'hebrew': {'a':'א', 'A':'ע', 'b':'ב', 'B':'ב', 'c':'כ', 'C':'ך', 'd':'ד', 'D':'ד', 'e':'א', 'E':'ע',
'f':'פ', 'F':'ף', 'g':'ג', 'G':'ג', 'h':'ה', 'H':'ה', 'i':'י', 'I':'י', 'j':'ג', 'J':'ג', 'k':'ק', 'K':'ק',
'l':'ל', 'L':'ל', 'm':'מ', 'M':'ם', 'n':'נ', 'N':'ן', 'o':'ו', 'O':'ו', 'p':'פ', 'P':'ף', 'q':'ח', 'Q':'ח',
'r':'ר', 'R':'ר', 's':'ס', 'S':'ש', 't':'ת', 'T':'ט', 'u':'ו', 'U':'ו', 'v':'ו', 'V':'ו', 'w':'ו', 'W':'ו',
'x':'צ', 'X':'ץ', 'y':'י', 'Y':'י', 'z':'ז', 'Z':'ז'},
'arabic': {'a':'ا', 'A':'ع', 'b':'ب', 'B':'ب', 'c':'ك', 'C':'ق', 'd':'د', 'D':'ض',
'e':'إ', 'E':'أ', 'f':'ف', 'F':'ف', 'g':'غ', 'G':'غ', 'h':'ح', 'H':'ه', 'i':'ى', 'I':'إ',
'j':'ج', 'J':'ظ', 'k':'ك', 'K':'ق', 'l':'ل', 'L':'ل', 'm':'م', 'M':'م', 'n':'ن', 'N':'ن', 'o':'و', 'O':'ؤ',
'p':'پ', 'P':'پ', 'q':'ق', 'Q':'ك', 'r':'ر', 'R':'ر', 's':'س', 'S':'ص', 't':'ت', 'T':'ط', 'u':'و', 'U':'ؤ',
'v':'و', 'V':'ؤ', 'w':'و', 'W':'ؤ', 'x':'خ', 'X':'خ', 'y':'ي', 'Y':'ئ', 'z':'ذ', 'Z':'ز',
'1':'١', '2':'٢', '3':'٣', '4':'٤', '5':'٥', '6':'٦', '7':'٧', '8':'٨', '9':'٩', '0':'٠',
"'":'ء', '`':'ة', '[':'ث', '{':'چ', ']':'ش', '}':'ژ'},
'greek': {'a':'α', 'A':'Α', 'b':'β', 'B':'Β', 'c':'ς', 'C':'ς', 'd':'δ', 'D':'Δ',
'e':'ε', 'E':'Ε', 'f':'φ', 'F':'Φ', 'g':'θ', 'G':'Θ', 'h':'χ', 'H':'Χ', 'i':'ι', 'I':'Ι', 'j':'θ', 'J':'Θ', 
'k':'κ', 'K':'Κ', 'l':'λ', 'L':'Λ', 'm':'μ', 'M':'Μ', 'n':'ν', 'N':'Ν', 'o':'ο', 'O':'Ο', 'p':'π', 'P':'Π',
'q':'ψ', 'Q':'Ψ', 'r':'ρ', 'R':'Ρ', 's':'σ', 'S':'Σ', 't':'τ', 'T':'Τ', 'u':'η', 'U':'Η', 'v':'υ', 'V':'Υ',
'w':'ω', 'W':'Ω', 'x':'ξ', 'X':'Ξ', 'y':'γ', 'Y':'Γ', 'z':'ζ', 'Z':'Ζ'}
}

 /**
 * Converts keystrokes pressed to the selected language
 * @param object evt
 */
/* protected */ i18n.keyPressed = function(evt) {
    if (typeof evt != 'undefined') {
        var charCode = evt.which;
        var chr = String.fromCharCode(charCode);
        if (i18n.language == 'default' || typeof i18n.language[chr] == 'undefined') {
            return true;
        }
        var loc = this.selectionStart;
        if (loc == this.value.length) {
            this.value += i18n.language[chr];
        } else {
            this.value = this.value.substring(0, loc) + i18n.language[chr] + this.value.substring(this.selectionEnd, this.value.length);
            loc++;
            this.setSelectionRange(loc, loc);
        }
        evt.preventDefault();
    } else { //IE
        evt = window.event;
        var charCode = evt.keyCode;
        var chr = String.fromCharCode(charCode);
        if (i18n.language == 'default' || typeof i18n.language[chr] == 'undefined') {
            return true;
        }
        var bookmark = document.selection.createRange().getBookmark();
        var selection = this.createTextRange();
        selection.moveToBookmark(bookmark);
        var before = this.createTextRange();
        before.collapse(true);
        before.setEndPoint("EndToStart", selection);
        var loc = before.text.length;
        if (loc == this.value.length) {
            this.value += i18n.language[chr];
        } else {
            var end = (loc + selection.text.length);
            this.value = this.value.substring(0, loc) + i18n.language[chr] + this.value.substring(end, this.value.length);
            loc++;
            before.collapse(true)
            before.moveStart('character', loc);
            before.moveEnd('character', 0);
            before.select();
        }
        return false;
    }
}

 /**
 * Builds the keyboard display for the selected language
 */
/* protected */ i18n.getKeyboardLayout = function() {
    var specialUpper = {'`': '~', '-':'_', '=':'+', '[': '{', ']': '}', '\\':'|', ';':':', "'": '"'}
    var qwerty = [
        ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '[', ']', '\\'],
        ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', "'"],
        ['z', 'x', 'c', 'v', 'b', 'n', 'm', ', ', '.', '/']
    ];
    var margin = 13;
    if (typeof i18n.language['`'] != 'undefined') {
        if (typeof i18n.language['1'] != 'undefined') {
            qwerty.unshift(['`', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '=']);
        } else {
            qwerty[0].unshift('`');
            qwerty[0][qwerty[0].length] = '-';
            qwerty[0][qwerty[0].length] = '=';
        }
        margin = 48;
    }
    var keyboard = '<div class="keyboardcontainer">';
    for (var row in qwerty) {
        keyboard += '<div class="keyboard keyboardrow' + row + '">';
        for (var chr in qwerty[row]) {
            if (typeof i18n.language[qwerty[row][chr]] != 'undefined') {
                var upper = qwerty[row][chr].toUpperCase();
                if (upper == qwerty[row][chr] && typeof specialUpper[upper] != 'undefined') {
                    upper = specialUpper[upper];
                }
                if (upper != qwerty[row][chr] && typeof i18n.language[upper] != 'undefined') {
                    keyboard += '<div class="key"><div>' + i18n.language[upper] + '<br />' + i18n.language[qwerty[row][chr]] + '</div>' + upper + '<br />' + qwerty[row][chr] + '</div>';
                } else {
                    keyboard += '<div class="key"><div><br />' + i18n.language[qwerty[row][chr]] + '</div><br />' + qwerty[row][chr] + '</div>';
                }
            }
        }
        keyboard += '</div>';
    }
    keyboard += '</div>';
    if (typeof i18n.css == 'undefined') {
        i18n.css = '.keyboardcontainer {margin-top: 5px;}\n '
            + '.keyboard {clear: left;}\n '
            + '.keyboardrow1 {margin-left: ' + margin + 'px;}\n '
            + '.keyboardrow2 {margin-left: ' + (margin + 20) + 'px;}\n '
            + '.keyboardrow3 {margin-left: ' + (margin + 40) + 'px;}\n '
            + '.keyboard .key {float: left; width: 28px; height: 30px; border: 1px solid; margin: 2px; padding: 3px; font-weight: bold;}\n '
            + '.keyboard .key div {float: right; font-weight: normal;}\n';
        var css = document.createElement('style');
        css.setAttribute('type', 'text/css');
        if (typeof css.styleSheet == 'undefined') {
            css.appendChild(document.createTextNode(i18n.css));
        } else {
            css.styleSheet.cssText = i18n.css;
        }
        document.getElementsByTagName('head')[0].appendChild(css);
    }
    return keyboard;
}

 /**
 * Internal array of existing keyboard displays
 * @var array
 */
/* protected */ i18n.keyboards = []

/**
 * Toggles the display of a keyboard
 * @param str id
 */
/* public */ i18n.toggleKeyboard = function(id) {
    var keyboard = document.getElementById(id);
    if (!keyboard) {
        return;
    }
    i18n.keyboards[i18n.keyboards.length] = id;
    var link = document.getElementById('keyboardlink_' + id);
    if (keyboard.innerHTML == '' && i18n.languageName != 'english') {
        keyboard.innerHTML = i18n.getKeyboardLayout();
        link.style.border='1px inset';
    } else {
        keyboard.innerHTML = '';
        link.style.border='0px';
    }
}

/**
 * Changes the keyboard layout to the currently selected language
 */
/* protected */ i18n.updateKeyboard = function() {
    var keyboardLayout = i18n.getKeyboardLayout();
    var keyboard;
    for (var i in i18n.keyboards) {
        keyboard = document.getElementById(i18n.keyboards[i]);
        if (keyboard.innerHTML != '') {
            keyboard.innerHTML = keyboardLayout;
        }
    }
}

/**
 * Change the current language
 * @param str lang
 */
/* public */ i18n.setLanguage = function(lang) {
    var prevButton; var currentButton;
    for (var x = 1; x <= i18n.languageLinkCount; x++) {
        prevButton = document.getElementById('languagelink_' + i18n.languageName + '_' + x);
        currentButton = document.getElementById('languagelink_' + lang + '_' + x);
        if (prevButton) {
            prevButton.style.border='0px';
        }
        if (currentButton) {
            currentButton.style.border='1px inset';
        }
    }
    i18n.language = (typeof i18n.languages[lang] != 'undefined' ? i18n.languages[lang] : 'english');
    i18n.languageName = lang
    i18n.updateKeyboard();
}

/**
 * Limits the array of languages available (default is all languages) and if to include the default language (English.)
 * FYI: Setting to just a single language and hiding English will restrict form entry to that language.
 * @param mixed langs Can be a string or an array containing multiple strings
 * @param Boolean hideEnglish
 */
/* public */ i18n.setLanguages = function(langs, hideEnglish) {
    if (typeof i18n.initialized == 'undefined') {
        i18n();
    }
    i18n.hideEnglish = (typeof hideEnglish == 'undefined' ? false : hideEnglish);
    if (typeof langs != 'undefined') {
        i18n.langs = (typeof langs == 'object' ? langs : [langs]);
    } else {
        i18n.langs = [];
        var x = 0;
        for (var key in i18n.languages) {
            i18n.langs[x++] = key;
        }
    }
    if (i18n.hideEnglish) {
        i18n.setLanguage(i18n.langs[0]);
    }
}

 /**
 * Internal counter of language-link button-arrays that are displayed
 * @var int
 */
/* private */ i18n.languageLinkCount = 0;

/**
 * Gets a link buttoms to change languages - buttons are returned in the order the languages are defined in i18n.setLanguages()
 * @return str
 */
/* public */ i18n.getLanguageLinks = function() {
    i18n.languageLinkCount++;
    var selected = ' style="border: 1px inset;"';
    var languageLinks = '';
    if (!i18n.hideEnglish) {
        languageLinks += '<a href="javascript: i18n.setLanguage(\'english\'); void(0);" title="English" id="languagelink_english_' + i18n.languageLinkCount + '"';
        if (i18n.languageName == 'english') {
            languageLinks += selected;
        }
        languageLinks += '>EN</a>';
    }
    if (typeof i18n.langs != 'undefined' && (i18n.langs.length == 1 && languageLinks == '') || i18n.langs.length == 0) { //no buttons if only one language
        return '';
    }
    for (var i in i18n.langs) {
        if (typeof i18n.languages[i18n.langs[i]] != 'undefined') {
            languageLinks += ' ' + '<a href="javascript: i18n.setLanguage(\'' + i18n.langs[i] + '\'); void(0);" title="Phonetic ' + i18n.langs[i].substring(0, 1).toUpperCase() + i18n.langs[i].substring(1) + '" id="languagelink_' + i18n.langs[i] + '_' + i18n.languageLinkCount + '"';
            if (i18n.languageName == i18n.langs[i]) {
                languageLinks += selected;
            }
            languageLinks += '>' + i18n.langs[i].substring(0, 2).toUpperCase() + '</a>';
        }
    }
    return languageLinks;
}

/**
 * Gets a link to toggle keyboard display
 * @param str id Determines which keyboard to open (created by i18n.getKeyboard)
 * @param str label Optional, the word "keyboard" will be used if omitted
 * @return str
 */
/* protected */ i18n.getKeyboardLink = function(id, label) {
    if (typeof label == 'undefined') {
        label = 'keyboard';
    }
    return '<a href="javascript: i18n.toggleKeyboard(\'' + id + '\'); void(0);" id="keyboardlink_' + id + '">' + label + '</a>';
}

/**
 * Gets a keyboard link to display the language key-mapping
 * @param str id Optional, keyboard will replace the contents of the element for the ID supplied; if id is omitted then keyboard will display inline
 * @param str label Optional, the word "keyboard" will be used if omitted
 * @return str
 */
/* public */ i18n.getKeyboard = function(id, label) {
    if (typeof id == 'undefined') {
        id = 'keyboard_' + Math.floor(Math.random() * 1000);
        return i18n.getKeyboardLink(id, label) + '<div id="' + id + '"></div>';
    } else {
        return i18n.getKeyboardLink(id, label);
    }
}