function* fibonacci() {
    let [prev, curr] = [0, 1];
    for (;;) {
        [prev, curr] = [curr, prev + curr];
        yield curr;
    }
}

var f = fibonacci();
f.next() // 1
f.next() // 2
f.next() // 3
f.next() // 5
f.next() // 8
f.next() // 13
f.next() // 21
