import hashing.poseidon.poseidon;

function merkle_root(array: [field;8]) -> field {
    const amount_of_leaves: u32 = 8;
    const log2_amount_leaves: u32 = 3;
    let padding = [0field;25];
    let array_of_leaves = [...array, ...padding];

    for i in 0..log2_amount_leaves {
        for j in 0..amount_of_leaves {
            let step = 2**(i);
            // This is the modulus
            let should_skip = j-(j/2)*2;
            if (((j+1)*step) < 8) && (should_skip == 0){
                array_of_leaves[j*step] = 
                    poseidon(
                        array_of_leaves[j*step], 
                        array_of_leaves[(j+1)*step]
                    );
            }
        }
    }
    return array_of_leaves[0];
}
