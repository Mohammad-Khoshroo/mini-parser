int one() { return 1; }
int sum(int a, int b) { return a + b; }
string echo(string message) { return message; }
void finish() { return; }

main() {
    int x;
    x = sum(one(), sum(2, 3));
    x = (lambda(int a, int b) => sum(a, b))(x, one());
    x = (lambda(int offset) => offset + x)(2);
    echo((lambda() => "hello")());
    finish();
}
