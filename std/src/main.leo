import hashing.*;
import integer.*;
import array.*;
import str.*;
import matrix.sum as matrix_sum;
import matrix.mul as matrix_mul;
import matrix.*;
import array.contains as array_contains;
import str.contains as str_contains;

function main() -> u32  {
    let a = matrix_mul([[0field; 128]; 768], [[1field; 10]; 128]) == [[0field; 10]; 768];
    return 0u32;
}
/*
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

// verify_proof() tests

@test()
function test_proofs_validation(){
    let leaf: field = 1;
    let proof: [field;3] = [2, 5639452814959479716333797092602429568041408410490188951967730026708667799362,6811329200201340627416984918056766552180813916433450573759408907577084397184];
    let path: [bool;3] = [false, false, false];
    let root: field = 833453432365499780361700154225551479355839019916612454159711825224580327701;
    console.assert(verify_proof(leaf, proof, path , root));
    let bad_proof: [field;3] = [3, 5639452814959479716333797092602429568041408410490188951967730026708667799362,6811329200201340627416984918056766552180813916433450573759408907577084397184];
    console.assert(!verify_proof(leaf, bad_proof, path, root));
    let bad_path: [bool;3] = [true, true, true];
    console.assert(!verify_proof(leaf, proof, bad_path, root));
    let bad_root: field = 32;
    console.assert(!verify_proof(leaf, proof, path, bad_root));

    let leaf2: field = 3;
    let proof2: [field;3] = [2, 6741600571531499538076626459614881881572634471432793830237600055083617801110,7040568090966913659889165548176415317933794382062127083870106037652670242975];
    let path2: [bool;3] = [true, false, true];
    let root2: field = 833453432365499780361700154225551479355839019916612454159711825224580327701;
    console.assert(verify_proof(leaf2, proof2, path2, root2));
    let bad_proof2: [field;3] = [3, 5639452814959479716333797092602429568041408410490188951967730026708667799362,6811329200201340627416984918056766552180813916433450573759408907577084397184];
    console.assert(!verify_proof(leaf2, bad_proof2, path2, root2));
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

// array count() tests
@test()
function test_count_counts_array_elements() {
    let array: [i32; 8] = [1, 2, 3, 4, 5, 6, 7, 8];

    console.assert(count(array) == 8);
}

// array delete() tests
@test()
function test_array_delete_deletes_an_element() {
    let array: [i32; 8] = [1, 2, 3, 4, 5, 6, 7, 8];
    let expected_array: [i32; 7] = [1, 2, 3, 5, 6, 7, 8];

    console.assert(expected_array == delete(array, 4));
}

@test()
function test_array_delete_deletes_first_element_of_array() {
    let array: [i32; 8] = [1, 2, 3, 4, 5, 6, 7, 8];
    let expected_array: [i32; 7] = [2, 3, 4, 5, 6, 7, 8];

    console.assert(expected_array == delete(array, 1));
}

@test()
function test_array_delete_deletes_last_element_of_array() {
    let array: [i32; 8] = [1, 2, 3, 4, 5, 6, 7, 8];
    let expected_array: [i32; 7] = [1, 2, 3, 4, 5, 6, 7];

    console.assert(expected_array == delete(array, 8));
}

@test()
function test_array_delete_deletes_only_first_occurrence_when_element_is_repeated() {
    let array: [i32; 8] = [1, 2, 3, 4, 3, 6, 7, 8];
    let expected_array: [i32; 7] = [1, 2, 4, 3, 6, 7, 8];

    console.log("{}", delete(array, 3));
    console.assert(expected_array == delete(array, 3));
}

@test()
function test_array_delete_deletes_only_first_occurrence_when_all_elements_are_the_same() {
    let array: [i32; 8] = [1, 1, 1, 1, 1, 1, 1, 1];
    let expected_array: [i32; 7] = [1, 1, 1, 1, 1, 1, 1];

    console.assert(expected_array == delete(array, 1));
}

// array max() tests
@test()
function test_maximum_element_is_found_in_array() {
    let array: [i32; 8] = [1, 2, 3, 4, 8, 5, 6, 7];
    let max: i32 = 8;

    console.assert(max == max(array));
}

@test()
function test_maximum_element_is_found_in_array_when_maximum_is_the_first_element() {
    let array: [i32; 8] = [34, 2, 3, 4, 5, 6, 7, 8];
    let max: i32 = 34;

    console.assert(max == max(array));
}

@test()
function test_maximum_element_is_found_in_array_when_maximum_is_the_last_element() {
    let array: [i32; 8] = [1, 2, 3, 4, 5, 6, 7, 97];
    let max: i32 = 97;

    console.assert(max == max(array));
}

@test()
function test_maximum_element_is_found_in_array_when_maximum_is_a_repeated_element() {
    let array: [i32; 8] = [1, 2, 67, 4, 0, 67, 6, 67];
    let max: i32 = 67;

    console.assert(max == max(array));
}

// array min() tests
@test()
function test_minimum_element_is_found_in_array() {
    let array: [i32; 8] = [1, 2, 3, 4, 0, 5, 6, 7];
    let min: i32 = 0;

    console.assert(min == min(array));
}

@test()
function test_minimum_element_is_found_in_array_when_minimum_is_the_first_element() {
    let array: [i32; 8] = [-4, 2, 3, 4, 0, 5, 6, 7];
    let min: i32 = -4;

    console.assert(min == min(array));
}

@test()
function test_minimum_element_is_found_in_array_when_minimum_is_the_last_element() {
    let array: [i32; 8] = [1, 2, 3, 4, 0, 5, 6, -7];
    let min: i32 = -7;

    console.assert(min == min(array));
}

@test()
function test_minimum_element_is_found_in_array_when_minimum_is_a_repeated_element() {
    let array: [i32; 8] = [1, 2, -7, 4, 0, -7, 6, -7];
    let min: i32 = -7;

    console.assert(min == min(array));
}

// array sum() tests
@test()
function test_sum_adds_all_elements_in_array() {
    let array: [i32; 8] = [2, 4, 6, 8, 10, 12, 14, 16];
    let sum: i32 = 72;

    console.assert(sum == sum(array));
}

@test()
function test_sum_adds_all_elements_in_array_with_positive_and_negative_integers() {
    let array: [i32; 8] = [2, -4, -6, 8, 10, -12, 14, 16];
    let sum: i32 = 28;

    console.assert(sum == sum(array));
}

@test()
function test_array_is_reversed() {
    let array: [i32; 8] = [0, 1, 2, 3, 4, 5, 6, 7];
    let reversed_array: [i32; 8] = [7, 6, 5, 4, 3, 2, 1, 0];
    console.assert(reversed_array == reverse(array));
}

// array contains() tests
@test()
function test_array_contains_an_element() {
    let array: [i32; 8] = [1, 2, 3, 4, 5, 6, 7, 8];

    console.assert(array_contains(array, 4) == true);
}

@test()
function test_array_contains_an_element_when_element_is_first_element_in_array() {
    let array: [i32; 8] = [1, 2, 3, 4, 5, 6, 7, 8];

    console.assert(array_contains(array, 8) == true);
}

@test()
function test_array_contains_an_element_when_element_is_the_last_element_in_array() {
    let array: [i32; 8] = [1, 2, 3, 4, 5, 6, 7, 8];

    console.assert(array_contains(array, 1) == true);
}

@test()
function test_array_does_not_contain_an_element() {
    let array: [i32; 8] = [1, 2, 3, 4, 5, 6, 7, 8];

    console.assert(array_contains(array, 0) == false);
}

// string capitalize() tests
@test()
function test_already_capitalized_string_remains_the_same() {
    let str: [char; 16] = "Abcdefghijklmnop";
    console.assert(capitalize(str) == str);
}

@test()
function test_string_capitalize_a_lowercase_string() {
    let str: [char; 16] = "abcdefghijklmnop";
    console.assert(capitalize(str) == "Abcdefghijklmnop");
}

@test()
function test_string_capitalize_a_string_with_some_uppercase_characters() {
    let str: [char; 16] = "abcdEfgHijklMnoP";
    console.assert(capitalize(str) == "Abcdefghijklmnop");
}

@test()
function test_string_capitalize_a_string_with_all_uppercase_characters() {
    let str: [char; 16] = "ABCDEFGHIJKLMNOP";
    console.assert(capitalize(str) == "Abcdefghijklmnop");
}

@test()
function test_string_capitalize_a_string_with_letters_numbers_and_symbols() {
    let str: [char; 16] = "ab5y!p=Jt&|r6T$b";
    console.assert(capitalize(str) == "Ab5y!p=jt&|r6t$b");
}

// string to_lower() tests
@test()
function test_string_with_lowercase_characters_remains_unchanged() {
    let str: [char; 16] = "abcdefghijklmnop";
    console.assert(to_lower(str) == "abcdefghijklmnop");
}

@test()
function test_string_with_upper_and_lowercase_characters_is_converted_to_lowercase() {
    let str: [char; 16] = "AbcDefgHijkLMnoP";
    console.assert(to_lower(str) == "abcdefghijklmnop");
}

@test()
function test_string_with_uppercase_characters_is_converted_to_lowercase() {
    let str: [char; 16] = "ABCDEFGHIJKLMNOP";
    console.assert(to_lower(str) == "abcdefghijklmnop");
}

@test()
function test_a_string_with_letters_numbers_and_symbols_is_converted_to_lowercase() {
    let str: [char; 16] = "aB5y!P=Jt&|r6T$b";
    console.assert(to_lower(str) == "ab5y!p=jt&|r6t$b");
}

// string to_upper() tests
@test()
function test_string_with_uppercase_characters_remains_unchanged() {
    let str: [char; 16] = "ABCDEFGHIJKLMNOP";
    console.assert(to_upper(str) == "ABCDEFGHIJKLMNOP");
}

@test()
function test_string_with_upper_and_lowercase_characters_is_converted_to_uppercase() {
    let str: [char; 16] = "AbcDefgHijkLMnoP";
    console.assert(to_upper(str) == "ABCDEFGHIJKLMNOP");
}

@test()
function test_string_with_lowercase_characters_is_converted_to_uppercase() {
    let str: [char; 16] = "abcdefghijklmnop";
    console.assert(to_upper(str) == "ABCDEFGHIJKLMNOP");
}

@test()
function test_a_string_with_letters_numbers_and_symbols_is_converted_to_uppercase() {
    let str: [char; 16] = "aB5y!P=Jt&|r6T$b";
    console.assert(to_upper(str) == "AB5Y!P=JT&|R6T$B");
}

// string contains() tests
@test()
function test_string_contains_its_first_eight_characters() {
    console.assert(str_contains("abcdefghijklmnop", "abcdefgh"));
}

@test()
function test_string_contains_its_last_eight_characters() {
    console.assert(str_contains("abcdefghijklmnop", "ijklmnop"));
}

@test()
function test_string_contains_a_substring() {
    console.assert(str_contains("abcdefghijklmnop", "defghijk"));
}

@test()
function test_string_does_not_contain_another_string() {
    console.assert(!str_contains("abcdefghijklmnop", "qrstuvwx"));
}

@test()
function test_string_does_not_contain_another_string_with_common_characters() {
    console.assert(!str_contains("abcdefghijklmnop", "mnopqrst"));
}

@test()
function test_string_does_not_contain_a_permuted_substring() {
    console.assert(!str_contains("abcdefghijklmnop", "abcfdegh"));
}

@test()
function test_string_contains_is_case_sensitive() {
    console.assert(!str_contains("abcdefghijklmnop", "ABcDefGh"));
}

// matrix sum() tests
@test()
function test_sum_zero_matrix_returns_zero_matrix() {
    let zero_matrix = [[0field; 28]; 28];
    
    console.assert(matrix_sum(zero_matrix, zero_matrix) == zero_matrix);
}

@test()
function test_sum_zero_matrix_to_non_zero_matrix_returns_non_zero_matrix() {
    let zero_matrix = [[0field; 28]; 28];
    let matrix = [[1field; 28]; 28];
    
    console.assert(matrix_sum(zero_matrix, matrix) == matrix);
}

@test()
function test_sum_two_different_matrix_returns_their_sum() {
    let matrix1 = [[1field; 28]; 28];
    let matrix2 = [[2field; 28]; 28];
    
    console.assert(matrix_sum(matrix1, matrix2) == [[3field; 28]; 28]);
}

// matrix mul_square_matrix() tests
@test()
function test_mul_zero_square_matrix_returns_zero_matrix() {
    let zero_matrix = [[0field; 28]; 28];
    
    console.assert(mul_square_matrix(zero_matrix, zero_matrix) == zero_matrix);
}

@test()
function test_mul_zero_square_matrix_with_non_zero_matrix_returns_zero_matrix() {
    let zero_matrix = [[0field; 28]; 28];
    let matrix = [[1field; 28]; 28];
    
    console.assert(mul_square_matrix(zero_matrix, matrix) == zero_matrix);
}

@test()
function test_mul_two_different_square_matrix_returns_their_product() {
    let matrix1 = [[1field; 28]; 28];
    let matrix2 = [[2field; 28]; 28];
    
    console.assert(mul_square_matrix(matrix1, matrix2) == [[56field; 28]; 28]);
}

// matrix mul() tests
@test()
function test_mul_zero_non_square_matrix_returns_zero_matrix() {  
    console.assert(matrix_mul([[0field; 128]; 768], [[0field; 10]; 128]) == [[0field; 10]; 768]);
}

@test()
function test_mul_zero_non_square_matrix_with_non_zero_matrix_returns_zero_matrix() {
    console.assert(matrix_mul([[0field; 128]; 768], [[1field; 10]; 128]) == [[0field; 10]; 768]);
}

@test()
function test_mul_two_different_non_square_matrix_returns_their_product() {
    console.assert(matrix_mul([[1field; 128]; 768], [[2field; 10]; 128]) == [[256field; 10]; 768]);
}
*/
// matrix transpose_square_matrix() tests
@test()
function test_transpose_zero_square_matrix_returns_zero_matrix() {  
    console.assert(transpose_square_matrix([[0field; 28]; 28]) == [[0field; 28]; 28]);
}

@test()
function test_mul_non_zero_square_matrix_returns_the_transposed_matrix() {
    let matrix = [[0field; 28]; 28];
    let transposed_matrix = [[0field; 28]; 28];
    let element = 0field;
    for i in 0..28 {
        for j in 0..28 {
            matrix[i][j] = element;
            element += 1field;
        }
        element = 0field;
    }

    element = 0field;
    for i in 0..28 {
        for j in 0..28 {
            transposed_matrix[i][j] = element;
        }
        element += 1field;
    }
    // console.log("{MATRIX: }", matrix);
    // console.log("{TRANSPOSE: }", transposed_matrix);
    console.assert(transpose_square_matrix(matrix) == transposed_matrix);
}

// matrix transpose() tests
@test()
function test_transpose_zero_non_square_matrix_returns_zero_matrix() {  
    console.assert(transpose([[0field; 128]; 768]) == [[0field; 128]; 768]);
}

@test()
function test_mul_non_zero_non_square_matrix_returns_the_transposed_matrix() {
    let matrix = [[0field; 128]; 768];
    let transposed_matrix = [[0field; 128]; 768];
    let element = 0field;
    for i in 0..768 {
        for j in 0..128 {
            matrix[i][j] = element;
            element += 1field;
        }
        element = 0field;
    }

    element = 0field;
    for i in 0..768 {
        for j in 0..128 {
            transposed_matrix[i][j] = element;
        }
        element += 1field;
    }

    console.assert(transpose(matrix) == transposed_matrix);
}
