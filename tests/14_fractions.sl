int gcd(int a, int b) {
    if (b == 0) return a;
    return gcd(b, a % b);
}

void showFraction(int top, int bottom) {
    int factor = gcd(top, bottom);
    int numerator = top / factor;
    int denominator = bottom / factor;
    if (denominator == 1) {
        print("whole");
        print(numerator);
    } else {
        print(numerator);
        print("/");
        print(denominator);
    }
    return;
}

main() {
    int denominator = 2;
    while (denominator <= 6) {
        int numerator = denominator;
        while (numerator <= denominator * 2) {
            showFraction(numerator, denominator);
            numerator = numerator + 1;
        }
        denominator = denominator + 1;
    }
}
