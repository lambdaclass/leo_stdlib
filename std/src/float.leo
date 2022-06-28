circuit Float {
    sign: bool,
    exponent: u8, 
    fraction: u8

    function equals(self, rhs: Self) -> bool{
        return self.sign == rhs.sign && self.exponent == rhs.exponent && self.fraction == rhs.fraction;
    }

    function add(self, rhs: Self) -> Self{
        // EXP 2 y el otro EXP 10 hay que pasar todo a exp 10 y despues sumar
        if(self.exponent > rhs.exponent){
            let exp_diff = self.exponent - rhs.exponent;
            let fraction_eq_exp = rhs.fraction / (10**exp_diff);
            let added_fraction = self.fraction + fraction_eq_exp;
            let (normalized_fraction, shifts_to_normalize) = ten_shifts_to_normalize(added_fraction);
            
            console.log("Shifts: {}", shifts_to_normalize);
            let normalized_exponent = self.exponent + shifts_to_normalize;
            console.log("Normalized exponent: {}", normalized_exponent);

            return Self { sign: self.sign, exponent: normalized_exponent, fraction: normalized_fraction };
        }else if(self.exponent == rhs.exponent){
            return Self { sign: self.sign, exponent: self.exponent, fraction: self.fraction + rhs.fraction };
        }else{
            let exp_diff = rhs.exponent - self.exponent;
            let fraction_eq_exp = self.fraction ** exp_diff;
            let added_fraction = rhs.fraction + fraction_eq_exp;
            return Self { sign: self.sign, exponent: self.exponent, fraction: added_fraction };
        }
    }
}

function ten_shifts_to_normalize(num: u8) -> (u8,u8) {
    let normalized_number: u8 = 0;
    let count: u8 = 0;
    let norm = false;
    for i in 0..8 {
        if norm == false && (num - num / 10 * 10 == 0) {
            count += 1;
            num = num / 10;
        } else {
            norm = true;
        }
    }
    return (num,count);
}

@test
function same_exponent_test(){
    // 1.0000000000000010 * 10
    let adder = Float { sign: true, exponent: 1, fraction: 10};
    // 1.0000000000000004 * 10
    let augend = Float { sign: true, exponent: 1, fraction: 4};
    let expected_result = Float { sign:true, exponent: 1, fraction: 14};
    console.log("Added value: {}", adder.add(augend));
    console.assert(adder.add(augend).equals(expected_result));
}

@test
function self_bigger_exponent_test(){
    // 1.0000000000000010 * 10 
    let adder = Float { sign: true, exponent: 1, fraction: 1};
    // 1.0000000000000004
    let augend = Float { sign: true, exponent: 0, fraction: 4};
    let expected_result = Float { sign:true, exponent: 1, fraction: 1};
    console.log("Added value: {}", adder.add(augend));
    console.assert(adder.add(augend).equals(expected_result));
}

