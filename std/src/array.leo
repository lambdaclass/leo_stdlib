function reverse(array: [i32; 8]) -> [i32; 8] {
    let reversed_array = [0i32; 8];
    for i in 0..8 {
        reversed_array[7-i] = array[i]; 
    }
    return reversed_array;
}
