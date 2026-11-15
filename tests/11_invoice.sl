int discount(int units, int price) {
    int gross = units * price;
    if (units >= 4) return gross / 10;
    return 0;
}

string invoiceLabel(int total) {
    if (total >= 200) return "large order";
    else return "standard order";
}

main() {
    int item = 1;
    int subtotal = 0;
    /* Each item has its own price
       and quantity discount. */
    while (item <= 5) {
        int price = 12 + item * 3;
        int units = item + 1;
        int net = units * price - discount(units, price);
        if (net > 0) {
            subtotal = subtotal + net;
            print(net);
        }
        item = item + 1;
    }
    int tax = (lambda(int base) => base / 20)(subtotal);
    print(invoiceLabel(subtotal));
    print(subtotal + tax);
}
