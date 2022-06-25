function sum(array: [i32; 8]) -> i32 {
    let sum: i32 = 0;
    for i in 0..8 {
        sum += array[i];
    }
    return sum;
}

function reverse(array: [i32; 8]) -> [i32; 8] {
    let reversed_array = [0i32; 8];
    for i in 0..8 {
        reversed_array[7-i] = array[i]; 
    }
    return reversed_array;
}

function contains(array: [i32; 8], element: i32) -> bool {
    let contains = false;
    for i in 0..8 {
        if array[i] == element {
            contains = true;
        }
    }
    return contains;
}
