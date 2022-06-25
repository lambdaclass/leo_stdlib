function delete(array: [i32; 8], element: i32) -> [i32; 7] {
    let deleted_array = [0i32; 7];
    let deleted: bool = false;
    for i in 0..7 {
        if array[i] != element && deleted == false {
            deleted_array[i] = array[i];
        } else if array[i] != element && deleted == true {
            deleted_array[i] = array[i+1];
        } else {
            deleted_array[i] = array[i+1];
            deleted = true;
        }
    }
    return deleted_array;
}

function max(array: [i32; 8]) -> i32 {
    let max = array[0];
    for i in 1..8 {
        if array[i] > max {
            max = array[i];
        }
    }
    return max;
}

function min(array: [i32; 8]) -> i32 {
    let min = array[0];
    for i in 1..8 {
        if array[i] < min {
            min = array[i];
        }
    }
    return min;
}

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
