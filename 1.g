var data = ["jzln78l6phtndcgseven", "6bgqscglgsninefour9nine", [...], "44two1", "eightrtsjszc2"];

fun isDigit(char) {
    if (char == "0")
    {
        return true;
    }
    else if (char == "1")
    {
        return true;
    }
    else if (char == "2")
    {
        return true;
    }
    else if (char == "3")
    {
        return true;
    }
    else if (char == "4")
    {
        return true;
    }
    else if (char == "5")
    {
        return true;
    }
    else if (char == "6")
    {
        return true;
    }
    else if (char == "7")
    {
        return true;
    }
    else if (char == "8")
    {
        return true;
    }
    else if (char == "9")
    {
        return true;
    }
    else
    {
        return false;
    }
}

fun toDigit(char) {
    if (char == "0")
    {
        return 0;
    }
    else if (char == "1")
    {
        return 1;
    }
    else if (char == "2")
    {
        return 2;
    }
    else if (char == "3")
    {
        return 3;
    }
    else if (char == "4")
    {
        return 4;
    }
    else if (char == "5")
    {
        return 5;
    }
    else if (char == "6")
    {
        return 6;
    }
    else if (char == "7")
    {
        return 7;
    }
    else if (char == "8")
    {
        return 8;
    }
    else if (char == "9")
    {
        return 9;
    }
    else
    {
        return false;
    }
}

fun firstDigit(string) {
    var chars = str_to_list(string);
    var len = length(chars);
    for (var i = 0; i < len; i = i + 1) {
        if (isDigit(chars[i])) {
            return toDigit(chars[i]);
        }
    }
}

fun lastDigit(string) {
    var chars = str_to_list(string);
    var len = length(chars);
    for (var i = len - 1; i >= 0; i = i - 1) {
        if (isDigit(chars[i])) {
            return toDigit(chars[i]);
        }
    }
}

fun calibrationValue(string) {
    return 10*firstDigit(string) + lastDigit(string);
}

// one
// two
// six
// nine
// four
// five
// three
// seven
// eight

fun firstNumber(string) {
    var chars = str_to_list(string);
    var len = length(chars);
    for (var i = 0; i < len; i = i + 1) {
        if (isDigit(chars[i])) {
            return toDigit(chars[i]);
        }
        else if ((chars[i] == "o") and (chars[i+1] == "n") and (chars[i+2] == "e")) {
            return 1;
        }
        else if ((chars[i] == "t") and (chars[i+1] == "w") and (chars[i+2] == "o")) {
            return 2;
        }
        else if ((chars[i] == "s") and (chars[i+1] == "i") and (chars[i+2] == "x")) {
            return 6;
        }
        else if ((chars[i] == "n") and (chars[i+1] == "i") and (chars[i+2] == "n") and (chars[i+3] == "e")) {
            return 9;
        }
        else if ((chars[i] == "f") and (chars[i+1] == "o") and (chars[i+2] == "u") and (chars[i+3] == "r")) {
            return 4;
        }
        else if ((chars[i] == "f") and (chars[i+1] == "i") and (chars[i+2] == "v") and (chars[i+3] == "e")) {
            return 5;
        }
        else if ((chars[i] == "t") and (chars[i+1] == "h") and (chars[i+2] == "r") and (chars[i+3] == "e") and (chars[i+4] == "e")) {
            return 3;
        }
        else if ((chars[i] == "s") and (chars[i+1] == "e") and (chars[i+2] == "v") and (chars[i+3] == "e") and (chars[i+4] == "n")) {
            return 7;
        }
        else if ((chars[i] == "e") and (chars[i+1] == "i") and (chars[i+2] == "g") and (chars[i+3] == "h") and (chars[i+4] == "t")) {
            return 8;
        }
    }
}

fun lastNumber(string) {
    var chars = str_to_list(string);
    var len = length(chars);
    for (var i = len - 1; i >= 0; i = i - 1) {
        if (isDigit(chars[i])) {
            return toDigit(chars[i]);
        }
        else if ((chars[i] == "e") and (chars[i-1] == "n") and (chars[i-2] == "o")) {
            return 1;
        }
        else if ((chars[i] == "o") and (chars[i-1] == "w") and (chars[i-2] == "t")) {
            return 2;
        }
        else if ((chars[i] == "x") and (chars[i-1] == "i") and (chars[i-2] == "s")) {
            return 6;
        }
        else if ((chars[i] == "e") and (chars[i-1] == "n") and (chars[i-2] == "i") and (chars[i-3] == "n")) {
            return 9;
        }
        else if ((chars[i] == "r") and (chars[i-1] == "u") and (chars[i-2] == "o") and (chars[i-3] == "f")) {
            return 4;
        }
        else if ((chars[i] == "e") and (chars[i-1] == "v") and (chars[i-2] == "i") and (chars[i-3] == "f")) {
            return 5;
        }
        else if ((chars[i] == "e") and (chars[i-1] == "e") and (chars[i-2] == "r") and (chars[i-3] == "h") and (chars[i-4] == "t")) {
            return 3;
        }
        else if ((chars[i] == "n") and (chars[i-1] == "e") and (chars[i-2] == "v") and (chars[i-3] == "e") and (chars[i-4] == "s")) {
            return 7;
        }
        else if ((chars[i] == "t") and (chars[i-1] == "h") and (chars[i-2] == "g") and (chars[i-3] == "i") and (chars[i-4] == "e")) {
            return 8;
        }
    }
}

fun realCalibrationValue(string) {
    return 10*firstNumber(string) + lastNumber(string);
}

var total = 0;
for (var j = 0; j < length(data); j = j + 1) {
    total = total + calibrationValue(data[j]);
}
print total;

var sum = 0;
for (var k = 0; k < length(data); k = k + 1) {
    sum = sum + realCalibrationValue(data[k]);
}
print sum;

// print calibrationValue("1abc2");
// print calibrationValue("pqr3stu8vwx");
// print calibrationValue("a1b2c3d4e5f");
// print calibrationValue("treb7uchet");

// print realCalibrationValue("two1nine");
// print realCalibrationValue("eightwothree");
// print realCalibrationValue("abcone2threexyz");
// print realCalibrationValue("xtwone3four");
// print realCalibrationValue("4nineeightseven2");
// print realCalibrationValue("zoneight234");
// print realCalibrationValue("7pqrstsixteen");
