import integer.mod.mod;

function main() -> u32  {
    return 0;
}

@test() 
function test_remainder_with_small_positive_number_and_small_positive_divisor() {
    console.assert(mod(0, 4) == 0);
    console.assert(mod(1, 4) == 1);  
    console.assert(mod(3, 4) == 3);
    console.assert(mod(4, 4) == 0); 
    console.assert(mod(6, 4) == 2); 
    console.assert(mod(22, 4) == 2); 
    console.assert(mod(23, 4) == 3); 
    console.assert(mod(24, 4) == 0); 
}

@test() 
function test_modulo_with_small_positive_number_and_small_negative_divisor() {
    console.assert(mod(0, -4) == 0);
    console.assert(mod(1, -4) == 1);  
    console.assert(mod(3, -4) == 3);
    console.assert(mod(4, -4) == 0); 
    console.assert(mod(6, -4) == 2); 
    console.assert(mod(22, -4) == 2); 
    console.assert(mod(23, -4) == 3); 
    console.assert(mod(24, -4) == 0); 
}

@test() 
function test_remainder_with_small_positive_number_and_large_positive_divisor() {
    console.assert(mod(0, 2147483646) == 0);
    console.assert(mod(1, 2147483646) == 1);  
    console.assert(mod(14348907, 2147483646) == 14348907);
}

@test() 
function test_remainder_with_small_positive_number_and_large_negative_divisor() {
    console.assert(mod(0, -2147483646) == 0);
    console.assert(mod(1, -2147483646) == 1);  
    console.assert(mod(5, -2147483646) == 5);
}

@test() 
function test_remainder_with_small_negative_number_and_small_positive_divisor() {
    console.assert(mod(-1, 4) == 1);  
    console.assert(mod(-3, 4) == 3);
    console.assert(mod(-4, 4) == 0); 
    console.assert(mod(-6, 4) == 2); 
    console.assert(mod(-22, 4) == 2); 
    console.assert(mod(-23, 4) == 3); 
    console.assert(mod(-24, 4) == 0); 
}

@test() 
function test_remainder_with_small_negative_number_and_small_negative_divisor() {
    console.assert(mod(-1, -4) == 1);  
    console.assert(mod(-3, -4) == 3);
    console.assert(mod(-4, -4) == 0); 
    console.assert(mod(-6, -4) == 2); 
    console.assert(mod(-22, -4) == 2); 
    console.assert(mod(-23, -4) == 3); 
    console.assert(mod(-24, -4) == 0); 
}

@test() 
function test_remainder_with_small_negative_number_and_large_positive_divisor() {
    console.assert(mod(0, 2147483646) == 0);
    console.assert(mod(-1, 2147483646) == 1);  
    console.assert(mod(-5, 2147483646) == 5);
}

@test() 
function test_remainder_with_small_negative_number_and_large_negative_divisor() {
    console.assert(mod(0, -2147483646) == 0);
    console.assert(mod(-1, -2147483646) == 1);  
    console.assert(mod(-5, -2147483646) == 5);
}

@test() 
function test_remainder_with_large_positive_number_and_small_positive_divisor() {
    console.assert(mod(2147483646, 3) == 0);
    console.assert(mod(2147483645, 3) == 2);  
    console.assert(mod(2147483644, 3) == 1);
}

@test() 
function test_remainder_with_large_positive_number_and_small_negative_divisor() {
    console.assert(mod(2147483646, -3) == 0);
    console.assert(mod(2147483645, -3) == 2);  
    console.assert(mod(2147483644, -3) == 1);
}

@test() 
function test_remainder_with_large_positive_number_and_large_positive_divisor() {
    console.assert(mod(2147483646, 2147483646) == 0);
    console.assert(mod(2147483646, 1073741823) == 0);  
    console.assert(mod(2147483646, 1073741822) == 2);
    console.assert(mod(2147483645, 2147483646) == 2147483645);
}

@test() 
function test_remainder_with_large_positive_number_and_large_negative_divisor() {
    console.assert(mod(2147483646, -2147483646) == 0);
    console.assert(mod(2147483646, -1073741823) == 0);  
    console.assert(mod(2147483646, -1073741822) == 2);
    console.assert(mod(2147483645, -2147483646) == 2147483645);
}

@test() 
function test_remainder_with_large_negative_number_and_small_positive_divisor() {
    console.assert(mod(2147483646, 4) == 2);
    console.assert(mod(2147483645, 4) == 1);  
    console.assert(mod(2147483644, 4) == 0);
    console.assert(mod(2147483643, 4) == 3);
}

@test() 
function test_remainder_with_large_negative_number_and_small_negative_divisor() {
    console.assert(mod(2147483646, -4) == 2);
    console.assert(mod(2147483645, -4) == 1);  
    console.assert(mod(2147483644, -4) == 0);
    console.assert(mod(2147483643, -4) == 3);
}

@test() 
function test_remainder_with_large_negative_number_and_large_positive_divisor() {
    console.assert(mod(-2147483646, 2147483646) == 0);
    console.assert(mod(-2147483646, 1073741823) == 0);  
    console.assert(mod(-2147483646, 1073741822) == 2);
    console.assert(mod(-2147483645, 2147483646) == 2147483645);
}

@test() 
function test_remainder_with_large_negative_number_and_large_negative_divisor() {
    console.assert(mod(-2147483646, -2147483646) == 0);
    console.assert(mod(-2147483646, -1073741823) == 0);  
    console.assert(mod(-2147483646, -1073741822) == 2);
    console.assert(mod(-2147483645, -2147483646) == 2147483645);
}
