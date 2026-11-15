main() {
    int score;
    if (true) score = 1; else score = 2;
    if (false)
        if (true) score = 3;
        else score = 4;
    else score = 5;
    if (false) score = 6;
    else if (true) score = score + 1;
    else score = 0;
}
