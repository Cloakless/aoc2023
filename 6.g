var time = [61,[...],66];
var distance = [643,[...],1041];

var newTime = [61[...]66];
var newDistance = [64[...]41];

var score = 1;
var len = length(time);
for (var m = 0; m < len; m = m + 1) {
    var wins = 0;
    for (var n = 0; n < time[m]; n = n + 1) {
        if (((time[m]-n)* n) > distance[m]) {
            wins = wins + 1;
        }
    }
    score = score * wins;
}

print score;

var score = 1;
var len = length(newTime);
for (var m = 0; m < len; m = m + 1) {
    var wins = 0;
    for (var n = 0; n < newTime[m]; n = n + 1) {
        if (((newTime[m]-n)* n) > newDistance[m]) {
            wins = wins + 1;
        }
    }
    score = score * wins;
}

// we know it's about 3.51502e+07
print (score - 35150000);
