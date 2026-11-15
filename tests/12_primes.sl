bool prime(int n) {
    if (n < 2) return false;
    int divisor = 2;
    while (divisor * divisor <= n) {
        if (n % divisor == 0) return false;
        divisor = divisor + 1;
    }
    return true;
}

int nextPrime(int n) {
    int candidate = n + 1;
    while (!prime(candidate)) candidate = candidate + 1;
    return candidate;
}

main() {
    int current = 2;
    int previous = 2;
    int largestGap = 0;
    while (current < 50) {
        int gap = current - previous;
        if (gap > largestGap) {
            largestGap = gap;
            print("new gap");
            print(gap);
        }
        previous = current;
        current = nextPrime(current);
    }
    print(largestGap);
}
