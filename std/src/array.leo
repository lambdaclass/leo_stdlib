function delete(array: [i32; 8], element: i32) -> [i32; 7] {
    // TODO: what if there are no occurrences? Currently we would drop the last element.
    // TODO: what if there are multiple occurrences? Is it OK to delete only the first one?
    let deleted_array: [i32; 7] = [0, 0, 0, 0, 0, 0, 0];
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
