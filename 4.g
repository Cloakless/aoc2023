var cards = ["Card   1: 81  1 43 40 49 51 38 65 36  4 | 21 15  1 43 60  9 83 81 35 49 40 38 82 65 20  4 58 94 16 89 84 10 77 48 76", [...], "Card 198: 69 30 47 82 65 23 79 32  3 80 |  5  1 55 62 86 75 36 14 31  7 38 18 66 64 53 59 10 22 96 27 13 85 37 91 51"];

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

fun sum(list) {
    var len = length(list);
    var tot = 0;
    for (var i = 0; i < len; i = i + 1) {
        tot = tot + list[i];
    }
    return tot;
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

fun listToInts(list) {
    var len = length(list);
    var new_list = [];
    for (var i = 0; i < len; i = i + 1) {
        append(new_list, toInt(list[i]));
    }
    return new_list;
}

fun cardScore(winning, held) {
    var num_held = length(held);
    var total = 0;
    var num_wins = 0;
    for (var j = 0; j < num_held; j = j + 1) {
        if (isElementOf(winning, held[j])) {
            num_wins = num_wins + 1;
            if (total == 0) {
                total = 1;
            }
            else {
                total = total * 2;
            }
        }
    }
    return [total, num_wins];
}

var card_deck = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

// test data
//var cards = ["Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53", "Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19", "Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1", "Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83", "Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36", "Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11"];
//var card_deck = [1,1,1,1,1,1];

var num_cards = length(cards);
var total = 0;

for (var ii = 0; ii < num_cards; ii = ii + 1) {
    var card = cards[ii];
    var title = split(str_to_list(card), ":")[0];
    var numbers = split(str_to_list(card), ":")[1];
    var id = toInt(split(title, " ")[1]);
    var part_A = split(split(numbers, "|")[0]," ");
    var part_B = split(split(numbers, "|")[1]," ");
    var win_nums = listToInts(part_A);
    var cur_nums = listToInts(part_B);
    var score = cardScore(win_nums, cur_nums);
    total = total + score[0];
    var bonus = score[1];
    if (bonus > 0) {
        for (var j = 0; j < bonus; j = j+1) {
            card_deck[ii + j + 1] = card_deck[ii + j + 1] + card_deck[ii];
        }
    }
}
print total;
print sum(card_deck);
// Haven't worked out how to print integers yet
print (sum(card_deck) - 8470000);
