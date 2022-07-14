function sum(matrix1: [[field; 28]; 28], matrix2: [[field; 28]; 28]) -> [[field; 28]; 28] {
    let sum = [[0field; 28]; 28];
        for i in 0..28 {
            for j in 0..28 {
                sum[i][j] = matrix1[i][j] + matrix2[i][j];
            }
        }
    return sum;
}

function mul(matrix1: [[field; 128]; 784], matrix2: [[field; 10]; 128]) -> [[field; 10]; 784] {
    let product = [[0field; 10]; 784];
    for i in 0..784 {
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

function scalar_mul(scalar: field, matrix: [[field; 28]; 28]) -> [[field; 28]; 28] {
    let product = [[0field; 28]; 28];
    for i in 0..28 {
        for j in 0..28 {
            product[i][j] = scalar * matrix[i][j];
        }
    }
    return product;
}

function vector_mul(vec: [field; 28], matrix: [[field; 28]; 28]) -> [field; 28] {
    let product = [0field; 28];
    for i in 0..28 {
        for j in 0..28 {
            product[i] += vec[j] * matrix[i][j];
        }
    }
    return product;
}

function transpose(matrix: [[field; 128]; 784]) -> [[field; 784]; 128] {
    let result = [[0field; 784]; 128];

    for i in 0..784 {
        for j in 0..128 {
            result[j][i] = matrix[i][j];
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

function flatten(matrix: [[field; 28]; 28]) -> [field; 784] {
    let result = [0field; 784];
    for i in 0..28 {
        for j in 0..28 {
            result[28*i+j] = matrix[i][j];
        }
    }
    return result;
}

/*
function shuffle(matrix: [[i32; 28]; 28]) -> [[i32; 28]; 28] {
    return [[0i32; 28]; 28];
}
*/
