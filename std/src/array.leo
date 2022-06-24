function sum(array: [i32; 8]) -> i32 {
    let sum: i32 = 0;
    for i in 0..8 {
        sum += array[i];
    }
    return sum;
}
