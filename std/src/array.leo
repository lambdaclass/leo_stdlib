function count(array: [i32; 8]) -> i32 {
    let count: i32 = 0;
    for i in 0..8 {
        count += 1;
    }
    return count;
}
