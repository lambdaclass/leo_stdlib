function sum(matrix1: [[field; 28]; 28], matrix2: [[field; 28]; 28]) -> [[field; 28]; 28] {
    let sum = [[0field; 28]; 28];
        for i in 0..28 {
            for j in 0..28 {
                sum[i][j] = matrix1[i][j] + matrix2[i][j];
            }
        }
    return sum;
}

function mul(matrix1: [[field; 128]; 768], matrix2: [[field; 10]; 128]) -> [[field; 10]; 768] {
    let product = [[0field; 10]; 768];
    for i in 0..768 {
        for j in 0..10 {
            let sum: field = 0;
            for k in 0..128 {
                sum = sum + matrix1[i][k] * matrix2[k][j];
            }
            product[i][j] = sum;
        }
    }
    return product;
}

function mul_square_matrix(matrix1: [[field; 28]; 28], matrix2: [[field; 28]; 28]) -> [[field; 28]; 28] {
    let product = [[0field; 28]; 28];
    for i in 0..28 {
        for j in 0..28 {
            let sum: field = 0;
            for k in 0..28 {
                sum = sum + matrix1[i][k] * matrix2[k][j];
            }
            product[i][j] = sum;
        }
    }
    return product;
}

function transpose(matrix: [[field; 128]; 768]) -> [[field; 128]; 768] {
    let result = [[0field; 128]; 768];

    for i in 0..768 {
        for j in 0..128 {
            result[i][j] = matrix[j][i];
        }
    }
    return result;
}

function transpose_square_matrix(matrix: [[field; 28]; 28]) -> [[field; 28]; 28] {
    let result = [[0field; 28]; 28];

    for i in 0..28 {
        for j in 0..28 {
            result[i][j] = matrix[j][i];
        }
    }
    return result;
}


/*
function shuffle(matrix: [[i32; 28]; 28]) -> [[i32; 28]; 28] {
    return [[0i32; 28]; 28];
}

function reshape(matrix: [[i32; 28]; 28]) -> [i32; 784] {
    return [0i32; 784];
}
*/
