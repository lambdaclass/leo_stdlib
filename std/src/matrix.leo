function sum(matrix1: [[i32; 28]; 28], matrix2: [[i32; 28]; 28]) -> [[i32; 28]; 28] {
    let sum = [[0i32; 28]; 28];
        for i in 0..28 {
            for j in 0..28 {
                sum[i][j] = matrix1[i][j] + matrix2[i][j];
            }
        }
    return sum;
}
/*
function mul(matrix1: [[i32; 28]; 28], matrix2: [[i32; 28]; 28]) -> [[i32; 28]; 28] {
    return [[0i32; 28]; 28];
}

function transpose(matrix: [[i32; 28]; 28]) -> [[i32; 28]; 28] {
    return [[0i32; 28]; 28];
}

function shuffle(matrix: [[i32; 28]; 28]) -> [[i32; 28]; 28] {
    return [[0i32; 28]; 28];
}

function reshape(matrix: [[i32; 28]; 28]) -> [i32; 784] {
    return [0i32; 784];
}
*/
