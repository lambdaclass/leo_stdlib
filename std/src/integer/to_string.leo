import integer.mod.mod;

function to_string(num: i32) -> [char; 10] { // 10 is the number of digits that the biggest possible i32 has.
    let num_as_string: [char; 10] = ['0'; 10];

    if num != 0 {
        let digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

        for i in 0..10 {
            let quotient: i32 = num / 10;
            let mod: i32 = mod(num, 10);
            if quotient == 0 {
                num_as_string[9-i] = digits[mod];
                num = 0;
            } else {
                num_as_string[9-i] = digits[mod];
                num = quotient;
            }          
        }
    }
    return num_as_string;
}
