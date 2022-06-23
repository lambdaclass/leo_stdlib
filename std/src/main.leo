import hashing.poseidon.poseidon;

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
