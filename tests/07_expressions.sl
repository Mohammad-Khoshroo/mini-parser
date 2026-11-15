main() {
    int n;
    n = (2 + 3) * 4 % 7;
    n = +n - -2;
    n = -(n + 1) * 3;
    if (!(n < 0) && n <= 7 || n == 12) n = n + 1;
    if (n >= 0 && n != 4 && n > -2) n = 2;
    if (!(!true || false)) n = (n + 1) * (n - 1);
}
