string grade(int mark) {
    if (mark >= 90) return "A";
    else if (mark >= 75) return "B";
    else if (mark >= 60) return "C";
    return "D";
}

int adjusted(int mark, int bonus) {
    int result = mark + bonus;
    if (result > 100) return 100;
    return result;
}

main() {
    int group = 0;
    while (group < 3) {
        int student = 0;
        int passing = 0;
        int sum = 0;
        while (student < 4) {
            int raw = 48 + group * 8 + student * 7;
            int mark = adjusted(raw, (lambda(int i) => i % 3)(student));
            string band = grade(mark);
            if (band != "D") passing = passing + 1;
            sum = sum + mark;
            print(band);
            student = student + 1;
        }
        print(sum / 4);
        print(passing);
        group = group + 1;
    }
}
