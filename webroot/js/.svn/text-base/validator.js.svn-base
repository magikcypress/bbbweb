<?php //this file needs to be parsed as PHP before being sent to the client
/**
 * This comes from the May 2007 php|architect article:
 * Unifying Server-Side and Client-Side Input Validation
 * @link http://www.Vork.us
 */
header('Content-type: application:x-javascript');

require_once '../../packages/validator';
$Validator = new Validator;

echo 'var commonRegex = ' . $Validator->getCommonData('commonRegex') . ';' . PHP_EOL;
echo 'var validCssColors = ' . json_encode($Validator->getValidCssColors()) . ';' . PHP_EOL;
?>
function Validator() {}

for (var key in commonRegex.match) {
    eval('Validator.isValid' + key + ' = function(val) {' +
    '    return commonRegex["match"]["' + key + '"].test(val);' +
    '}');
}

Validator.dom = function(id) {
    var retval;
    if (typeof document.getElementById != 'undefined') {
        retval = document.getElementById(id);
    } else if (typeof document.all != 'undefined') {
        retval = document.all[id];
    } else {
        retval = false;
    }
    return retval;
}

Validator.getNumbersOnly = function(val, integerOnly) {
    var regexType = (typeof integerOnly == 'undefined' || !integerOnly ? 'Numeric' : 'Integer');
    var matches = val.match(commonRegex['get'][regexType]);
    var numbers = '';
    for (var match in matches) {
        numbers += matches[match];
    }
    return numbers;
}

Validator.isValidTelephone = function(val, country) {
    var retval;
    if (typeof country == 'undefined' || country.toUpperCase() == 'US') {
        retval = commonRegex['match']['UsTelephone'].test(val);
    } else {
        retval = (Validator.getNumbersOnly(val).length > 6);
    }
    return retval;
}

Validator.isValidHexColorParent = Validator.isValidHexColor;
Validator.isValidHexColor = function(val) {
    if (typeof validCssColors[val] != 'undefined') {
        val = '#' + validCssColors[val];
    }
    return Validator.isValidHexColorParent(val);
}

Validator.getTrim = function(val) {
    return val.replace(commonRegex['get']['Trim'], '$1');
}

Validator.validateForm = function(formId) {
    var errors = new Array;
    var obj;
    for (var inputId in validations[formId]) {
        obj = Validator.dom(inputId);
        if (obj) {
            obj.value = Validator.getTrim(obj.value);
        }

        if (!obj || !Validator[validations[formId][inputId]](obj.value)) {
            errors[errors.length] = inputId;
        } else {
            Validator.dom(inputId + 'errorwrapper').innerHTML = '';
        }
    }

    if (errors.length) {
        var label = '';
        var errorsLength = errors.length;
        for (var x = 0; x < errorsLength; x++) {
            label = Validator.dom(errors[x] + 'label').innerHTML;
            //uncomment the next line if you consistently append a colon to your labels
            //label = label.substr(0, (label.length - 1));
            Validator.dom(errors[x] + 'errorwrapper').innerHTML = label + ' is not valid';
            if (!x) {
                Validator.dom(errors[x]).focus();
            }
        }
    }
    return !errors.length;
}