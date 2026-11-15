int add(int a, int b) { return a + b; }
int apply(func<int,int->int> op, int x) { return op(x, 2); }
void report() { print("done"); }
main() {
    func<int,int->int> op = add;
    print(apply(op, 3));
    op = lambda(int a, int b) => a * b;
    print(op(3, 4));
    func<void->void> notify = report;
    notify();
}
