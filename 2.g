var games = ["Game 1: 1 blue, 8 green; 14 green, 15 blue; 3 green, 9 blue; 8 green, 8 blue, 1 red; 1 red, 9 green, 10 blue", [...], "Game 100: 6 green, 15 red, 12 blue; 9 red; 16 red; 17 red, 3 blue, 7 green"];

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

fun index(list, char) {
    var len = length(list);
    for (var i = 0; i < len; i = i + 1) {
        if (list[i] == char) {
            return i;
        }
    }
    return nil;
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
    for (var k = start; k < end; k = k+1) {
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
        delete(list, 0);
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
        append(new_list, list[len-i-1]);
    }
    return new_list;
}

fun toInt(list) {
    var len = length(list);
    if (len == 1) {
        return (toDigit(list[0]));
    }
    else {
        return (toDigit(list[len-1]) + 10*toInt(lslice(list,0,len-1)));
    }
}

fun isValidRound(round, max) {
    var red_max = max[0];
    var green_max = max[1];
    var blue_max = max[2];
    var colours = split(round, ",");
    var num_colours = length(colours);
    for (var k = 0; k < num_colours; k = k + 1) {
        var result = split(colours[k], " ");
        var quantity = toInt(result[0]);
        var rgb = result[1][0];
        if (rgb == "r" and (quantity > red_max)) {
            return false;
        }
        else if (rgb == "g" and (quantity > green_max)) {
            return false;
        }
        else if (rgb == "b" and (quantity > blue_max)) {
            return false;
        }
    }
    return true;
}

fun isValidGame(results, max) {
    var rounds = split(results, ";");
    for (var round = 0; round < length(rounds); round = round + 1) {
        if (isValidRound(rounds[round], max) == false) {
            print "Game is invalid";
            return false;
        }
    }
    print "Game is valid";
    return true;
}

fun maxInGame(results) {
    var max_seen = [0,0,0];
    var rounds = split(results, ";");
    for (var round = 0; round < length(rounds); round = round + 1) {
        var colours = split(rounds[round], ",");
        var num_colours = length(colours);
        for (var k = 0; k < num_colours; k = k + 1) {
            var result = split(colours[k], " ");
            var quantity = toInt(result[0]);
            var rgb = result[1][0];
            if (rgb == "r" and (quantity > max_seen[0])) {
                max_seen[0] = quantity;
            }
            else if (rgb == "g" and (quantity > max_seen[1])) {
                max_seen[1] = quantity;
            }
            else if (rgb == "b" and (quantity > max_seen[2])) {
                max_seen[2] = quantity;
            }
        }
    }
    print max_seen;
    return max_seen;
}

var max = [12, 13, 14];
var num_games = length(games);

var counter = 0;
for (var i = 0; i < num_games; i = i + 1) {
    var game = games[i];
    print game;
    var title = split(str_to_list(game), ":")[0];
    var results = split(str_to_list(game), ":")[1];
    var gameID = toInt(split(title, " ")[1]);
    if (isValidGame(results, max)) {
        counter = counter + gameID;
    }
}
print counter;

var counter = 0;
for (var i = 0; i < num_games; i = i + 1) {
    var game = games[i];
    print game;
    var title = split(str_to_list(game), ":")[0];
    var results = split(str_to_list(game), ":")[1];
    var colour_max = maxInGame(results);

    counter = counter + colour_max[0]*colour_max[1]*colour_max[2];
}
print counter;
