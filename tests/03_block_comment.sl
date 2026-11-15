/* Before main:
   symbols } ; // are comment text. */
main() {
    int/* between
    tokens */value;
    value = 24 /* ignored:
    else { */ + 6;
    /* first */ value = value * 2; /* second */
    // /* inside a line comment
    value = value - 1;
}
/* after the closing brace
   end */
