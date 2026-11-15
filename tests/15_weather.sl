int reading(int day, int hour) {
    return 18 + (day * 7 + hour * 3) % 15;
}

string status(bool hot, bool cold) {
    if (hot && cold) return "mixed";
    if (hot) return "hot";
    if (cold) return "cold";
    return "steady";
}

main() {
    func<int,int->int> measure = reading;
    int peaks[1..4] = [0, 0, 0, 0];
    int history[1..4][0..7];
    int day = 1;
    while (day <= 4) {
        int hour = 0;
        int peak = measure(day, hour);
        bool hot = false;
        bool cold = false;
        while (hour < 8) {
            history[day][hour] = measure(day, hour);
            int value = history[day][hour];
            if (value > peak) peak = value;
            if (value >= 29) hot = true;
            if (value <= 20) cold = true;
            hour = hour + 1;
        }
        string label = (lambda(bool hi, bool lo) => status(hi, lo))(hot, cold);
        print(day);
        print(label);
        peaks[day] = peak;
        print(peaks[day]);
        day = day + 1;
    }
}
