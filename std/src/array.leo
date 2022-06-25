function contains(array: [i32; 8], element: i32) -> bool {
    let contains = false;
    for i in 0..8 {
        if array[i] == element {
            contains = true;
        }
    }
    return contains;
}
