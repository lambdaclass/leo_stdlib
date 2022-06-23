import hashing.poseidon.poseidon;

function main() -> u32  {
    return 0;
}

// poseidon() tests 
@test()  
function test_poseidon_is_same () {
    let hash_f1 = poseidon(123, 456);
    let hash_f2 = poseidon(123, 456);

    console.assert(hash_f1==hash_f2);
}

@test()  
function test_poseidon_is_different () {
    let hash_f1 = poseidon(123, 456);
    let hash_f2 = poseidon(456, 123);

    console.assert(hash_f1!=hash_f2);
}
