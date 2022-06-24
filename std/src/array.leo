function max(array: [i32; 8]) -> i32 {
    let max = array[0];
    for i in 1..8 {
        if array[i] > max {
            max = array[i];
        }
    }
    return max;
}
