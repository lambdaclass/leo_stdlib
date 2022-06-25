import hashing.*;
import integer.*;
import array.*;

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
function test_merkle_root_is_same () {
    let array1: [field;8] = [1,2,3,4,5,6,7,8];
    let array2: [field;8] = [1,2,3,4,5,6,7,8];

    let markle_root_1 = merkle_root(array1);
    let markle_root_2 = merkle_root(array2);

    console.assert(markle_root_1==markle_root_2);
}

@test()  
function test_merkle_root_is_different () {
    let array1: [field;8] = [1,2,3,4,5,6,7,8];
    let array2: [field;8] = [2,1,3,4,5,6,7,8];

    let markle_root_1 = merkle_root(array1);
    let markle_root_2 = merkle_root(array2);

    console.assert(markle_root_1!=markle_root_2);
}

// mod() tests
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

@test()
function test_zero_to_string() {
    console.assert("00000000000" == to_string(0));
}

@test()
function test_one_figure_positive_integer_to_string() {
    console.assert("00000000009" == to_string(9));
    console.assert("00000000008" == to_string(8));
    console.assert("00000000007" == to_string(7));
    console.assert("00000000006" == to_string(6));
    console.assert("00000000005" == to_string(5));
}

@test()
function test_two_figure_positive_integer_to_string() {
    console.assert("00000000099" == to_string(99));
    console.assert("00000000087" == to_string(87));
    console.assert("00000000078" == to_string(78));
    console.assert("00000000061" == to_string(61));
    console.assert("00000000020" == to_string(20));
    console.assert("00000000011" == to_string(11));
    console.assert("00000000010" == to_string(10));
}

@test()
function test_three_figure_positive_integer_to_string() {
    console.assert("00000000999" == to_string(999));
    console.assert("00000000871" == to_string(871));
    console.assert("00000000782" == to_string(782));
    console.assert("00000000613" == to_string(613));
    console.assert("00000000204" == to_string(204));
    console.assert("00000000115" == to_string(115));
    console.assert("00000000100" == to_string(100));
}

@test()
function test_four_figure_positive_integer_to_string() {
    console.assert("00000009999" == to_string(9999));
    console.assert("00000008712" == to_string(8712));
    console.assert("00000007823" == to_string(7823));
    console.assert("00000006134" == to_string(6134));
    console.assert("00000002045" == to_string(2045));
    console.assert("00000001156" == to_string(1156));
    console.assert("00000001000" == to_string(1000));
}

@test()
function test_five_figure_positive_integer_to_string() {
    console.assert("00000099999" == to_string(99999));
    console.assert("00000087121" == to_string(87121));
    console.assert("00000078233" == to_string(78233));
    console.assert("00000061345" == to_string(61345));
    console.assert("00000020457" == to_string(20457));
    console.assert("00000011569" == to_string(11569));
    console.assert("00000010000" == to_string(10000));
}

@test()
function test_six_figure_positive_integer_to_string() {
    console.assert("00000999999" == to_string(999999));
    console.assert("00000871212" == to_string(871212));
    console.assert("00000782334" == to_string(782334));
    console.assert("00000613456" == to_string(613456));
    console.assert("00000204578" == to_string(204578));
    console.assert("00000115690" == to_string(115690));
    console.assert("00000100000" == to_string(100000));
}

@test()
function test_seven_figure_positive_integer_to_string() {
    console.assert("00009999999" == to_string(9999999));
    console.assert("00001871212" == to_string(1871212));
    console.assert("00002782334" == to_string(2782334));
    console.assert("00003613456" == to_string(3613456));
    console.assert("00004204578" == to_string(4204578));
    console.assert("00005115690" == to_string(5115690));
    console.assert("00001000000" == to_string(1000000));
}

@test()
function test_eight_figure_positive_integer_to_string() {
    console.assert("00099999999" == to_string(99999999));
    console.assert("00018712121" == to_string(18712121));
    console.assert("00027823342" == to_string(27823342));
    console.assert("00036134563" == to_string(36134563));
    console.assert("00042045784" == to_string(42045784));
    console.assert("00051156905" == to_string(51156905));
    console.assert("00010000000" == to_string(10000000));
}

@test()
function test_nine_figure_positive_integer_to_string() {
    console.assert("00999999999" == to_string(999999999));
    console.assert("00198712121" == to_string(198712121));
    console.assert("00287823342" == to_string(287823342));
    console.assert("00376134563" == to_string(376134563));
    console.assert("00462045784" == to_string(462045784));
    console.assert("00551156905" == to_string(551156905));
    console.assert("00100000000" == to_string(100000000));
}

@test()
function test_biggest_possible_integer_to_string() {
    console.assert("02147483646" == to_string(2147483646));
}

@test()
function test_one_figure_negative_integer_to_string() {
    console.assert("-0000000009" == to_string(-9));
    console.assert("-0000000008" == to_string(-8));
    console.assert("-0000000007" == to_string(-7));
    console.assert("-0000000006" == to_string(-6));
    console.assert("-0000000005" == to_string(-5));
}

@test()
function test_two_figure_negative_integer_to_string() {
    console.assert("-0000000099" == to_string(-99));
    console.assert("-0000000087" == to_string(-87));
    console.assert("-0000000078" == to_string(-78));
    console.assert("-0000000061" == to_string(-61));
    console.assert("-0000000020" == to_string(-20));
    console.assert("-0000000011" == to_string(-11));
    console.assert("-0000000010" == to_string(-10));
}

@test()
function test_three_figure_negative_integer_to_string() {
    console.assert("-0000000999" == to_string(-999));
    console.assert("-0000000871" == to_string(-871));
    console.assert("-0000000782" == to_string(-782));
    console.assert("-0000000613" == to_string(-613));
    console.assert("-0000000204" == to_string(-204));
    console.assert("-0000000115" == to_string(-115));
    console.assert("-0000000100" == to_string(-100));
}

@test()
function test_four_figure_negative_integer_to_string() {
    console.assert("-0000009999" == to_string(-9999));
    console.assert("-0000008712" == to_string(-8712));
    console.assert("-0000007823" == to_string(-7823));
    console.assert("-0000006134" == to_string(-6134));
    console.assert("-0000002045" == to_string(-2045));
    console.assert("-0000001156" == to_string(-1156));
    console.assert("-0000001000" == to_string(-1000));
}

@test()
function test_five_figure_negative_integer_to_string() {
    console.assert("-0000099999" == to_string(-99999));
    console.assert("-0000087121" == to_string(-87121));
    console.assert("-0000078233" == to_string(-78233));
    console.assert("-0000061345" == to_string(-61345));
    console.assert("-0000020457" == to_string(-20457));
    console.assert("-0000011569" == to_string(-11569));
    console.assert("-0000010000" == to_string(-10000));
}

@test()
function test_six_figure_negative_integer_to_string() {
    console.assert("-0000999999" == to_string(-999999));
    console.assert("-0000871212" == to_string(-871212));
    console.assert("-0000782334" == to_string(-782334));
    console.assert("-0000613456" == to_string(-613456));
    console.assert("-0000204578" == to_string(-204578));
    console.assert("-0000115690" == to_string(-115690));
    console.assert("-0000100000" == to_string(-100000));
}

@test()
function test_seven_figure_negative_integer_to_string() {
    console.assert("-0009999999" == to_string(-9999999));
    console.assert("-0001871212" == to_string(-1871212));
    console.assert("-0002782334" == to_string(-2782334));
    console.assert("-0003613456" == to_string(-3613456));
    console.assert("-0004204578" == to_string(-4204578));
    console.assert("-0005115690" == to_string(-5115690));
    console.assert("-0001000000" == to_string(-1000000));
}

@test()
function test_eight_figure_negative_integer_to_string() {
    console.assert("-0099999999" == to_string(-99999999));
    console.assert("-0018712121" == to_string(-18712121));
    console.assert("-0027823342" == to_string(-27823342));
    console.assert("-0036134563" == to_string(-36134563));
    console.assert("-0042045784" == to_string(-42045784));
    console.assert("-0051156905" == to_string(-51156905));
    console.assert("-0010000000" == to_string(-10000000));
}

@test()
function test_nine_figure_negative_integer_to_string() {
    console.assert("-0999999999" == to_string(-999999999));
    console.assert("-0198712121" == to_string(-198712121));
    console.assert("-0287823342" == to_string(-287823342));
    console.assert("-0376134563" == to_string(-376134563));
    console.assert("-0462045784" == to_string(-462045784));
    console.assert("-0551156905" == to_string(-551156905));
    console.assert("-0100000000" == to_string(-100000000));
}

@test()
function test_smallest_possible_integer_to_string() {
    console.assert("-2147483646" == to_string(-2147483646));
}

// is_even() tests
@test()
function test_even_number_is_even() {
    console.assert(is_even(2));
    console.assert(is_even(28));
    console.assert(is_even(2524));
    console.assert(is_even(2147483646));
}

@test()
function test_odd_number_is_not_even() {
    console.assert(!is_even(3));
    console.assert(!is_even(25));
    console.assert(!is_even(323));
    console.assert(!is_even(2147483645));
}

// is_odd() tests
@test()
function test_odd_number_is_odd() {
    console.assert(is_odd(3));        
    console.assert(is_odd(25));
    console.assert(is_odd(323));
    console.assert(is_odd(2147483645));
}

@test()
function test_even_number_is_not_odd() {
    console.assert(!is_odd(2));
    console.assert(!is_odd(28));
    console.assert(!is_odd(2524));
    console.assert(!is_odd(2147483646));
}


// array contains() tests
@test()
function test_array_contains_an_element() {
    let array: [i32; 8] = [1, 2, 3, 4, 5, 6, 7, 8];

    console.assert(contains(array, 4) == true);
}

@test()
function test_array_contains_an_element_when_element_is_first_element_in_array() {
    let array: [i32; 8] = [1, 2, 3, 4, 5, 6, 7, 8];

    console.assert(contains(array, 8) == true);
}

@test()
function test_array_contains_an_element_when_element_is_the_last_element_in_array() {
    let array: [i32; 8] = [1, 2, 3, 4, 5, 6, 7, 8];

    console.assert(contains(array, 1) == true);
}

@test()
function test_array_does_not_contain_an_element() {
    let array: [i32; 8] = [1, 2, 3, 4, 5, 6, 7, 8];

    console.assert(contains(array, 0) == false);
}
