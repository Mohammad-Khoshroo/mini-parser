int nextRow(int row) { return row + 1; }

main() {
    int a[1..3] = [10, 20, 30];
    int offset[-1..1];
    offset = [a[1], a[2], a[3]];
    int i = 2;
    a[i] = offset[i - 2] + a[1];
    print(a[2]);
    string labels[4..4] = ["hello"];
    print(labels[4]);
    int m[1..2][-1..1] = [[1, 2, 3], [4, 5, 6]];
    m[i][0] = m[1][-1] + a[i];
    int row = 1;
    int col = -1;
    int step = 1;
    m[nextRow(row)][col + step] = 42;
    print(m[nextRow(row)][col + step]);
    m[1] = [7, 8, 9];
    print(m[2][0]);
    int cube[0..0][1..2][2..3] = [[[1, 2], [3, 4]]];
    cube[0][2][3] = m[1][1];
    print(cube[0][2][3]);
    int empty[1..0] = [];
    empty = [];
    int rows[1..2][1..0] = [[], []];
}
