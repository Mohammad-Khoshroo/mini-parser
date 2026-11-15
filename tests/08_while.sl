main() {
    int count = 0;
    int total = 0;
    while (count < 4) {
        int step = count;
        while (step > 0) {
            total = total + step;
            step = step - 1;
        }
        count = count + 1;
    }
    while (total > 5) total = total - 1;
    while (false) {}
}
