import hashing.poseidon.poseidon;
import hashing.merkle_tree.merkle_root;

function main() -> u32  {
    return 0;
}

// poseidon() tests 
@test()  
function test_poseidon_is_same () {
    let hash_f1 = poseidon(123field, 456field);
    let hash_f2 = poseidon(123field, 456field);

    console.assert(hash_f1==hash_f2);
}

@test()  
function test_poseidon_is_different () {
    let hash_f1 = poseidon(123field, 456field);
    let hash_f2 = poseidon(456field, 123field);

    console.assert(hash_f1!=hash_f2);
}

// merkle_tree_root() trests
@test()  
function test_merkle_tree_is_same () {
    let array1: [field;8] = [1,2,3,4,5,6,7,8];
    let array2: [field;8] = [1,2,3,4,5,6,7,8];

    let markle_root_1 = merkle_root(array1);
    let markle_root_2 = merkle_root(array2);

    console.assert(markle_root_1==markle_root_2);
}

@test()  
function test_merkle_tree_is_different () {
    let array1: [field;8] = [1,2,3,4,5,6,7,8];
    let array2: [field;8] = [2,1,3,4,5,6,7,8];

    let markle_root_1 = merkle_root(array1);
    let markle_root_2 = merkle_root(array2);

    console.assert(markle_root_1!=markle_root_2);
}
