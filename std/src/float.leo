const MAX_I32:i32 = 2147483647;
//additions of exponents must not overflow

const SPECIAL_VALUE_EXP = MAX_I32/2;
const MAX_EXP = MAX_I32/2 - 1;
const NAN: Float = Float { exponent: SPECIAL_VALUE_EXP, fraction: 1};
const POS_INF: Float = Float { exponent: SPECIAL_VALUE_EXP, fraction: 0};
const NEG_INF: Float = Float { exponent: SPECIAL_VALUE_EXP, fraction: 0};


circuit Float {
    exponent: i32, 
    fraction: i32

    function new(exponent: i32, fraction: i32) -> Self {
        return normalize_for_sum(Float { exponent, fraction });
    }

    function equals(self, rhs: Self) -> bool {
        return self.exponent == rhs.exponent && self.fraction == rhs.fraction;
    }

    function add(self, rhs: Self) -> Self {
        if self.exponent > rhs.exponent {
            let exp_diff: i32 = 0;
            if self.exponent > rhs.exponent {
                exp_diff = self.exponent - rhs.exponent;
            }
            let added_fraction = self.fraction + rhs.fraction / (10**exp_diff);
            return infinity_if_overflow(normalize_for_sum(Self{ exponent: self.exponent, fraction: added_fraction }));
        } else if self.exponent == rhs.exponent {
            return infinity_if_overflow(normalize_for_sum(Self{ exponent: self.exponent, fraction: self.fraction + rhs.fraction }));
        } else {
            let exp_diff: i32 = 0;
            if self.exponent < rhs.exponent {
                exp_diff = rhs.exponent - self.exponent;
            }
            let added_fraction = rhs.fraction + self.fraction / (10 ** exp_diff);
            return infinity_if_overflow(normalize_for_sum(Self{ exponent: rhs.exponent, fraction: added_fraction }));
        }
    }

    function sub(self, rhs: Self) -> Self {
        let substrahend = Float::new(rhs.exponent, -rhs.fraction);
        return self.add(substrahend);
    }

    function mul(self, rhs: Self) -> Self {
        let normalized_exponent: i32 = self.exponent + rhs.exponent;
        let normalized_fraction: i32 = self.fraction * rhs.fraction;

        for i in 0..6 {
            if (normalized_fraction > 9999 || normalized_fraction < -9999) {
                normalized_exponent += 1;
                normalized_fraction = normalized_fraction / 10;
            }
        }
        return infinity_if_overflow(Self{ exponent: normalized_exponent, fraction: normalized_fraction });
    }

    function div(self, rhs: Self) -> Self {
        if(self.fraction == rhs.fraction || self.fraction == -rhs.fraction){
            let normalized_exponent: i32 = self.exponent - rhs.exponent - 3;
            if self.fraction == -rhs.fraction {
                return infinity_if_overflow(Self{ exponent: normalized_exponent, fraction: -1000 });
            } else {
                return infinity_if_overflow(Self{ exponent: normalized_exponent, fraction: 1000 });
            }
        } else{
            let normalized_exponent: i32 = self.exponent - rhs.exponent - 4;
            let normalized_fraction: i32 = ((10000 * self.fraction) / rhs.fraction);
            return infinity_if_overflow(normalize_for_sum(Self{ exponent: normalized_exponent, fraction: normalized_fraction }));
        }
    }
}

function normalize_for_sum(num: Float) -> Float {
    let normalized_exponent: i32 = num.exponent;
    let normalized_fraction: i32 = num.fraction;

    if(num.fraction > 9999){
        normalized_fraction = normalized_fraction / 10;
        normalized_exponent += 1;
        return Float { exponent: normalized_exponent, fraction: normalized_fraction };
    }else{
        for i in 0..4 {
            if (normalized_fraction / 1000 == 0) {
                normalized_exponent -= 1;
                normalized_fraction = normalized_fraction * 10;
            }
        }
        return Float { exponent: normalized_exponent, fraction: normalized_fraction };
    }
}

function normalize_for_mul(num: Float) -> Float {
    let normalized_exponent: i32 = num.exponent;
    let normalized_fraction: i32 = num.fraction;
    for i in 0..4 {
        if (normalized_fraction / 1000 == 0) {
            normalized_exponent -= 1;
            normalized_fraction = normalized_fraction * 10;
        }
    }
    return Float { exponent: normalized_exponent, fraction: normalized_fraction };
}


function infinity_if_overflow(number: Float) -> Float {
    if(number.exponent > MAX_EXP){
        return POS_INF;
    }else if number.exponent < -MAX_EXP{
        return NEG_INF;
    } else {
        return number;
    }
}

@test
function test_addition_of_floats_with_same_exponent(){
    let augend = Float::new(1, 10);
    let addend = Float::new(1, 4);
    let sum = Float::new(1, 14);

    console.assert(augend.add(addend).equals(sum));
}

@test
function test_add_bigger_positive_float_to_positive_float_results_positive_float(){
    let augend = Float::new(1, 1);
    let addend = Float::new(0, 4);
    let sum = Float::new(0, 14);

    console.assert(augend.add(addend).equals(sum));
}

@test
function test_add_bigger_positive_float_to_negative_float_results_positive_float() {
    let augend = Float::new(2, 1);
    let addend = Float::new(1, -1);

    let sum = Float::new(1, 9);
    console.assert(augend.add(addend).equals(sum));
}

@test
function test_add_bigger_negative_float_to_positive_float_results_negative_float() {
    let augend = Float::new(2, -1);
    let addend = Float::new(1, 1);

    let sum = Float::new(0, -90);
    console.assert(augend.add(addend).equals(sum));
}

@test
function test_add_smaller_positive_float_to_positive_float_results_positive_float() {
    let augend = Float::new(0, 2);
    let addend = Float::new(2, 10);

    let sum = Float::new(0, 1002);
    console.assert(augend.add(addend).equals(sum));
}

@test 
function test_add_positive_augend_with_negative_exponent_to_positive_addend_with_positive_exponent() {
    let augend = Float::new(-1, 2);
    let addend = Float::new(2, 3);

    let sum = Float::new(-1, 3002);
    console.assert(augend.add(addend).equals(sum));
}

@test 
function test_add_positive_augend_with_positive_exponent_to_positive_addend_with_negative_exponent() {
    let augend = Float::new(1, 2);
    let addend = Float::new(-2, 3);

    let sum = Float::new(-2, 2003);
    console.assert(augend.add(addend).equals(sum));
}

@test 
function test_add_negative_augend_with_negative_exponent_to_negative_addend_with_negative_exponent() {
    let augend = Float::new(-1, -2);
    let addend = Float::new(-2, -3);

    let sum = Float::new(-2, -23);
    console.assert(augend.add(addend).equals(sum));
}

@test 
function test_add_negative_augend_with_negative_exponent_to_negative_addend_with_same_negative_exponent() {
    let augend = Float::new(-2, -2);
    let addend = Float::new(-2, -3);

    let sum = Float::new(-2, -5);
    console.assert(augend.add(addend).equals(sum));
}

@test
function test_substraction_with_substrahend_lower_than_minuend() {
    let minuend = Float::new(2, 9);
    let substrahend = Float::new(1, 5);

    let difference = Float::new(1, 85);
    console.assert(minuend.sub(substrahend).equals(difference));
}

@test
function test_substraction_with_minuend_lower_than_substrahend() {
    let minuend = Float::new(2, 9);
    let substrahend = Float::new(3, 5);

    let difference = Float::new(2, -41);
    console.assert(minuend.sub(substrahend).equals(difference));
}

@test() 
function test_float_multiplication () {
    let multiplicand = Float::new(3, 3);
    let multiplier = Float::new(4, 1);

    let product = Float::new(7, 3);
    console.assert(multiplicand.mul(multiplier).equals(product));
}

@test() 
function test_float_multiplication_neg_exp () {
    let multiplicand = Float::new(-3, 2);
    let multiplier = Float::new(-2, 3);

    let product = Float::new(-5, 6);
    console.assert(multiplicand.mul(multiplier).equals(product));
}

@test() 
function test_float_multiplication_neg_pos_exp () {
    let multiplicand = Float::new(-3, -2);
    let multiplier = Float::new(-2, 3);

    let product = Float::new(-5, -6);
    console.assert(multiplicand.mul(multiplier).equals(product));
}

@test()
function test_division_with_positive_dividend_greater_than_positive_divisor() {
    let divisor = Float::new(8, 7);
    let dividend = Float::new(5, 1);    
    let quotient = Float::new(-7, 1428);
    let result = dividend.div(divisor);

    console.assert(quotient.equals(result));
}

@test()
function test_division_with_positive_divisor_greater_than_positive_dividend() {
    let divisor = Float::new(3, 4);
    let dividend = Float::new(5, 1);
    let quotient = Float::new(0, 25);
    let result = dividend.div(divisor);

    console.assert(quotient.equals(result));
}

@test()
function test_division_with_positive_dividend_equal_to_positive_divisor() {
    let divisor = Float::new(8, 7);
    let dividend = Float::new(8, 7);
    let quotient = Float::new(0, 1);
    let result = dividend.div(divisor);
    console.log("This should be 1: {}", result);

    console.assert(quotient.equals(result));
}

@test()
function test_division_with_negative_dividend_and_positive_divisor() {
    let divisor = Float::new(8, -7);
    let dividend = Float::new(5, 1);    
    let quotient = Float::new(-7, -1428);
    let result = dividend.div(divisor);
    console.log("{}", result);
    console.assert(quotient.equals(result));
}

@test()
function test_division_with_negative_divisor_and_positive_dividend() {
    let divisor = Float::new(3, 4);
    let dividend = Float::new(5, -1);
    let quotient = Float::new(0, -25);
    let result = dividend.div(divisor);
    console.log("{}", result);
    console.assert(quotient.equals(result));
}

@test()
function test_division_with_divident_additive_inverse_of_divisor() {
    let dividend = Float::new(8, -7);
    let divisor = Float::new(8, 7);
    let quotient = Float::new(0, -1);
    let result = dividend.div(divisor);
    console.log("{}", result);
    console.assert(quotient.equals(result));
}

@test()
function test_division_with_order_of_magnitude_difference_dividend_greater_than_divisor() {
    let dividend = Float::new(8, 7);
    let divisor = Float::new(3, 7);
    let quotient = Float::new(5, 1);
    let result = dividend.div(divisor);
    console.log("Expected result: {}", quotient);
    console.log("Result: {}", result);
    console.assert(quotient.equals(result));
}

@test()
function test_division_with_order_of_magnitude_difference_dividend_smaller_than_divisor() {
    let dividend = Float::new(3, 7);
    let divisor = Float::new(8, 7);
    let quotient = Float::new(-5, 1);
    let result = dividend.div(divisor);
    console.log("Expected result: {}", quotient);
    console.log("Result: {}", result);
    console.assert(quotient.equals(result));
}

@test()
function test_mul_overflow_is_infinite() {
    let augend = Float::new(MAX_EXP / 2 + 2, 1);
    let addend = Float::new(MAX_EXP / 2 + 2, 1);
    let result = augend.mul(addend); 
    console.log("Expected result: {}", POS_INF);
    console.log("Result: {}", result);
    console.assert(result.equals(POS_INF));
}

@test()
function test_add_big_fractions() {
    let augend = Float::new(-4, 5000);
    let addend = Float::new(-4, 5000);
    let result = augend.add(addend); 
    console.assert(result.equals(Float::new(0,1)));
}

@test()
function test_add_overflow_is_infinite() {
    let augend = Float::new(MAX_EXP, 9999);
    let addend = Float::new(MAX_EXP, 1);
    let result = augend.add(addend); 
    console.log("Expected result: {}", POS_INF);
    console.log("Result: {}", result);
    console.assert(result.equals(POS_INF));
}

@test()
function test_add_overflow_lower_limit_is_not_infinite() {
    let augend = Float::new(MAX_EXP, 9998);
    let addend = Float::new(MAX_EXP, 1);
    let result = augend.add(addend); 
    console.log("Expected result: {}", POS_INF);
    console.log("Result: {}", result);
    console.assert(!result.equals(POS_INF));
}

@test()
function test_add_underflow_is_neg_inf() {
    let augend = Float::new(-MAX_EXP, -1);
    let addend = Float::new(-MAX_EXP, -9999);
    let result = augend.add(addend); 
    console.assert(!result.equals(NEG_INF));
}
