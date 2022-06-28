function mod(num: i32, divisor: i32) -> i32 {
    if num < 0 {
        num = -num;
    }

    if divisor < 0 {
        divisor = -divisor;
    }

    return num - (num / divisor * divisor);
}

function is_odd(num: i32) -> bool {
    return mod(num, 2) != 0;
}

function is_even(num: i32) -> bool {
    return mod(num, 2) == 0;
}

function to_string(num: i32) -> [char; 11] { // 10 is the number of digits that the biggest possible i32 has.
    let num_as_string: [char; 11] = ['0'; 11];
    let is_neg: bool = num < 0;
    if num != 0 {
        let digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
        if is_neg {
            num_as_string[0] = '-';
        }
        for i in 0..10 {
            let quotient: i32 = num / 10;
            let mod: i32 = mod(num, 10);
            if quotient == 0 {
                num_as_string[10-i] = digits[mod];
                num = 0;
            } else {
                num_as_string[10-i] = digits[mod];
                num = quotient;
            }          
        }
    }
    return num_as_string;
}
