int clampScore(int value) {
    if (value < 0) return 0;
    else if (value > 100) return 100;
    return value;
}

int apply(func<int->int> adjust, int raw) {
    return adjust(raw);
}

void showResult(string label, int average, bool passed) {
    print(label);
    print(average);
    if (passed) print("Passed");
    else print("Needs review");
    return;
}

main() {
    /* Groups start at 1.
       Scores within each group start at 0. */
    int scores[1..2][0..2] = [[74, 80, 86], [52, 61, 55]];
    string labels[1..2] = ["Group 1", "Group 2"];
    int bonus = 2;
    func<int->int> adjust = clampScore;
    int extra[1..0] = [];

    int group = 1;
    while (group <= 2) {
        if (group == 2)
            adjust = lambda(int x) => clampScore(x + bonus);
        int total = 0;
        int column = 0;
        while (column < 3) {
            int corrected;
            corrected = apply(adjust, scores[group][column]);
            scores[group][column] = corrected;
            total = total + corrected;
            column = column + 1;
        }

        int average = total / 3;
        if (2 * (total % 3) >= 3) average = average + 1;
        bool passed = (lambda(int n) => n >= 60)(average);
        {
            int margin = average - 60;
            bool borderline = !passed && margin >= -2 || passed && margin <= +2;
            if (borderline && margin != 0) print("Close to the passing score");
            showResult(labels[group], average, passed);
        }
        group = group + 1;
    }
}
