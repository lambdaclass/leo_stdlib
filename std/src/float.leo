const E_MAX: i32 = 127;

circuit Float {
    exponent: i32, 
    fraction: i32

    function new(exponent: i32, fraction: i32) -> Self {
        return normalize(Float { exponent, fraction });
    }
    function equals(self, rhs: Self) -> bool{
        return self.exponent == rhs.exponent && self.fraction == rhs.fraction;
    }

    function add(self, rhs: Self) -> Self {
        // EXP 2 y el otro EXP 10 hay que pasar todo a exp 10 y despues sumar
        if(self.exponent > rhs.exponent) {
            let exp_diff: i32 = 0;
            if(self.exponent > rhs.exponent){
                exp_diff = self.exponent - rhs.exponent;
            }
            let added_fraction = self.fraction + rhs.fraction / (10**exp_diff);
            //console.log("Added fraction: {}", added_fraction);
            return normalize(Self{ exponent: self.exponent, fraction: added_fraction });
        } else if(self.exponent == rhs.exponent) {
            return normalize(Self{ exponent: self.exponent, fraction: self.fraction + rhs.fraction });
        } else {
            let exp_diff: i32 = 0;
            if(self.exponent < rhs.exponent){
                exp_diff = rhs.exponent - self.exponent;
            }
            let added_fraction = rhs.fraction + self.fraction / (10 ** exp_diff);
            return normalize(Self{ exponent: rhs.exponent, fraction: added_fraction });
        }
    }
}

function normalize(num: Float) -> Float {
    let normalized_exponent: i32 = num.exponent;
    let normalized_fraction: i32 = num.fraction;
    let norm = false;
    for i in 0..4 {
        if norm == false && (normalized_fraction / 1000 == 0) {
            normalized_exponent -= 1;
            normalized_fraction = normalized_fraction * 10;
        } else {
            norm = true;
        }
    }
    return Float { exponent: normalized_exponent, fraction: normalized_fraction };
}



@test
function test_same_exponent_test(){
    let augend = Float::new(1, 10);
    let addend = Float::new(1, 4);
    let sum = Float::new(1, 14);
    console.assert(augend.add(addend).equals(sum));
}

@test
function test_self_bigger_exponent_test(){
    let augend = Float::new(1, 1);
    console.log("Augend: {}", augend);
    let addend = Float::new(0, 4);
    let sum = Float::new(0, 14);
    console.log("{}",augend.add(addend));
    console.assert(augend.add(addend).equals(sum));
}

@test
function test_add_bigger_positive_float_to_negative_float_results_positive_float() {
    let augend = Float::new(2, 1);
    let addend = Float::new(1, -1);

    let sum = Float::new(1, 9);
    console.log("Added value: {}", augend.add(addend));
    console.assert(augend.add(addend).equals(sum));
}

@test
function test_add_bigger_negative_float_to_positive_float_results_negative_float() {
    let augend = Float::new(2, -1);
    let addend = Float::new(1, 1);

    let sum = Float::new(0, -90);
    console.log("Added value: {}", augend.add(addend));
    console.assert(augend.add(addend).equals(sum));
}

@test
function test_add_first_smaller_than_second() {
    let augend = Float::new(0, 2);
    let addend = Float::new(2, 10);

    let sum = Float::new(0, 1002);
    console.log("Added value: {}", augend.add(addend));
    console.assert(augend.add(addend).equals(sum));
}

@test 
function test_add_positive_augend_with_negative_exponent_to_positive_addend_with_positive_exponent() {
    let augend = Float::new(-1, 2);
    let addend = Float::new(2, 3);

    let sum = Float::new(-1, 3002);
    console.log("Added value: {}", augend.add(addend));
    console.assert(augend.add(addend).equals(sum));
}

@test 
function test_add_positive_augend_with_positive_exponent_to_positive_addend_with_negative_exponent() {
    let augend = Float::new(1, 2);
    let addend = Float::new(-2, 3);

    let sum = Float::new(-2, 2003);
    console.log("Added value: {}", augend.add(addend));
    console.assert(augend.add(addend).equals(sum));
}

@test 
function test_add_negative_augend_with_negative_exponent_to_negative_addend_with_negative_exponent() {
    let augend = Float::new(-1, -2);
    let addend = Float::new(-2, -3);

    let sum = Float::new(-2, -23);
    console.log("Added value: {}", augend.add(addend));
    console.assert(augend.add(addend).equals(sum));
}

@test 
function test_add_negative_augend_with_negative_exponent_to_negative_addend_with_same_negative_exponent() {
    let augend = Float::new(-2, -2);
    let addend = Float::new(-2, -3);

    let sum = Float::new(-2, -5);
    console.log("Added value: {}", augend.add(addend));
    console.assert(augend.add(addend).equals(sum));
}

