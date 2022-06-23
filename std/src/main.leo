import integer.to_string.to_string;

function main() -> u32  {
    return 0;
}

// to_string() tests
@test()
function test_zero_to_string() {
    let zero = "0000000000";
    console.assert(zero == to_string(0));
}

@test()
function test_one_figure_positive_integer_to_string() {
    let seven = "0000000007";
    console.assert(seven == to_string(7));
}

