function min(array: [i32; 8]) -> i32 {
    let min = array[0];
    for i in 1..8 {
        if array[i] < min {
            min = array[i];
        }
    }
    return min;
}
