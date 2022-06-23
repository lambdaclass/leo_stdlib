function to_string(num: i32) -> [char; 10] { // 10 is the number of digits that the biggest possible i32 has.
    let num_as_string: [char; 10] = ['0'; 10];
    let digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    
    if num == 0 {
        return num_as_string;
    } else {
        for i in 0..9 {
            let quotient: i32 = num / 10;
            if quotient < 10 {
                num_as_string[i] = digits[quotient];
                return num_as_string;
            }
            let mod: i32 = mod(num, 10);
            num_as_string[i] = mod;
            num = quotient;          
        }
    }
}
