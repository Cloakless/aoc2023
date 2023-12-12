var seeds = [1263068588, [...], 154258863];
var seedToSoil = [[2056129205, 3495540274, 7275274], [...], [2910342837, 2132404068, 63130973]];
var soilToFertilizer = [[3192416630, 3819045895, 47516706], [...], [3851079612, 3601639846, 217406049]];
var fertilizerToWater = [[153835826, 1814144363, 127150990], [...], [1780437414, 1662829838, 74137726]];
var waterToLight = [[279076302, 606101520, 367597147], [...], [646673449, 362260767, 243840753]];
var lightToTemperature = [[208346365, 819874354, 29069132], [...], [1184457978, 355197947, 24892145]];
var temperatureToHumidity = [[4116612848, 1770461885, 178354448], [...], [1247707493, 1960164570, 108566]];
var humidityToLocation = [[3760908805, 3662107228, 155796250], [...], [900259193, 1880133562, 3909787]];


fun toDigit(char) {
    if (char == "0") {
        return 0;
    }
    else if (char == "1") {
        return 1;
    }
    else if (char == "2") {
        return 2;
    }
    else if (char == "3") {
        return 3;
    }
    else if (char == "4") {
        return 4;
    }
    else if (char == "5") {
        return 5;
    }
    else if (char == "6") {
        return 6;
    }
    else if (char == "7") {
        return 7;
    }
    else if (char == "8") {
        return 8;
    }
    else if (char == "9") {
        return 9;
    }
    else {
        return false;
    }
}

fun toChar(digit) {
    if (digit == 0) {
        return "0";
    }
    else if (digit == 1) {
        return "1";
    }
    else if (digit == 2) {
        return "2";
    }
    else if (digit == 3) {
        return "3";
    }
    else if (digit == 4) {
        return "4";
    }
    else if (digit == 5) {
        return "5";
    }
    else if (digit == 6) {
        return "6";
    }
    else if (digit == 7) {
        return "7";
    }
    else if (digit == 8) {
        return "8";
    }
    else if (digit == 9) {
        return "9";
    }
    else {
        return false;
    }
}

fun index(list, char) {
    var len = length(list);
    for (var i = 0; i < len; i = i + 1) {
        if (list[i] == char) {
            return i;
        }
    }
    return nil;
}

fun min(list) {
    var min = list[0];
    for (var i = 0; i < length(list); i = i + 1) {
        if (list[i] < min) {
            min = list[i];
        }
    }
    return min;
}

fun max(list) {
    var max = list[0];
    for (var i = 0; i < length(list); i = i + 1) {
        if (list[i] > max) {
            max = list[i];
        }
    }
    return max;
}

fun isElementOf(list, char) {
    var len = length(list);
    for (var i = 0; i < len; i = i + 1) {
        if (list[i] == char) {
            return true;
        }
    }
    return false;
}

fun split(list, char) {
    var new_list = [];

    split_build(list, char, new_list);
    return new_list;
}

fun split_build(list, char, new_list) {
    list = strip(list, char);
    var firstIndex = index(list, char);
    if (firstIndex == nil) {
        append(new_list, list);
    }
    else {
        var len = length(list);
        var head = lslice(list, 0, firstIndex);
        var tail = lslice(list, firstIndex + 1, len + 1);
        append(new_list, head);
        split_build(tail, char, new_list);
    }
}

fun lslice(list, start, end) {
    var len = length(list);
    if (start < 0) {
        start = 0;
    }
    if (end > len) {
        end = len;
    }
    var new_list = [];
    for (var k = start; k < end; k = k + 1) {
        append(new_list, list[k]);
    }
    return new_list;
}

fun slice(string, start, end) {
    var list = str_to_list(string);
    return lslice(list, start, end);
}

fun decap(list, char) {
    while (list[0] == char) {
        delete (list, 0);
    }
    return list;
}

fun strip(list, char) {
    return rev(decap(rev(decap(list, char)), char));
}

fun rev(list) {
    var new_list = [];
    var len = length(list);
    for (var i = 0; i < len; i = i + 1) {
        append(new_list, list[len - i - 1]);
    }
    return new_list;
}

fun toInt(list) {
    var len = length(list);
    if (len == 1) {
        return (toDigit(list[0]));
    }
    else {
        return (toDigit(list[len - 1]) + 10 * toInt(lslice(list, 0, len - 1)));
    }
}

fun listToInts(list) {
    var len = length(list);
    var new_list = [];
    for (var i = 0; i < len; i = i + 1) {
        append(new_list, toInt(list[i]));
    }
    return new_list;
}

fun transform(input, map) {
    var len = length(map);
    for (var i = 0; i < len; i = i + 1) {
        var rule = map[i];
        var a = rule[0];
        var b = rule[1];
        var c = rule[2];
        if ((input >= b) and(input < (b + c))) {
            return (input - b + a);
        }
    }
    return input;
}

fun display(int) {
    var temp = int;
    var num_string = "";
    var num_digits = 0;
    var switch = true;
    while (switch) {
        if (temp < 1) {
        switch = false;
        }
        else {
            temp = temp / 10;
            num_digits = num_digits + 1;
        }
    }
    var adder = 1;
    for (var i = 0; i < (num_digits - 1); i = i + 1) {
        adder = adder * 10;
    }
    var curr = 0;
    var digit = 0;
    var store = adder;
    while (curr < int) {
        if ((curr + adder) > int) {
            // Too high!
            num_string = num_string + toChar(digit);
            store = store / 10;
            adder = store;
            digit = 0;
        }
        else {
            curr = curr + adder;
            digit = digit + 1;
            if (curr == int) {
                num_string = num_string + toChar(digit);
            }
        }
    }
    while (length(str_to_list(num_string)) < num_digits) {
        // This is hacky and I hate it
        num_string = num_string + "0";
    }

    print num_string;
}

//var seeds = [79, 14, 55, 13];
//var seedToSoil = [[50, 98, 2], [52, 50, 48]];
//var soilToFertilizer = [[0, 15, 37], [37, 52, 2], [39, 0, 15]];
//var fertilizerToWater = [[49, 53, 8], [0, 11, 42], [42, 0, 7], [57, 7, 4]];
//var waterToLight = [[88, 18, 7], [18, 25, 70]];
//var lightToTemperature = [[45, 77, 23], [81, 45, 19], [68, 64, 13]];
//var temperatureToHumidity = [[0, 69, 1], [1, 0, 69]];
//var humidityToLocation = [[60, 56, 37], [56, 93, 4]];

var input = seeds;

var size = length(input);

for (var k = 0; k < size; k = k + 1) {
    input[k] = transform(input[k], seedToSoil);
    input[k] = transform(input[k], soilToFertilizer);
    input[k] = transform(input[k], fertilizerToWater);
    input[k] = transform(input[k], waterToLight);
    input[k] = transform(input[k], lightToTemperature);
    input[k] = transform(input[k], temperatureToHumidity);
    input[k] = transform(input[k], humidityToLocation);
}

display(min(input));

var curr_best = 9999999999999;
var seeds = [1263068588, [...], 154258863];
for (var ii = 0; ii < (length(seeds) / 2); ii = ii + 1) {
    var range = seeds[2 * ii + 1];
    var base = seeds[2 * ii];
    print "";
    print "Now working from the range beginning";
    display(base);
    for (var jj = 0; jj < range; jj = jj + 1) {
        var seed = base + jj;
        seed = transform(seed, seedToSoil);
        seed = transform(seed, soilToFertilizer);
        seed = transform(seed, fertilizerToWater);
        seed = transform(seed, waterToLight);
        seed = transform(seed, lightToTemperature);
        seed = transform(seed, temperatureToHumidity);
        seed = transform(seed, humidityToLocation);
        if (seed < curr_best) {
            curr_best = seed;
            print "";
            print "New best:";
            display(curr_best);
        }
    }
}

display(curr_best);
