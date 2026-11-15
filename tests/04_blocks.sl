main() {
    int level;
    level = 1;
    {}
    {
        int level;
        level = 2;
        { int inner; inner = level + 1; }
        {}
    }
    { level = level + 3; }
}
