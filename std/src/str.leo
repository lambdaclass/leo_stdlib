const lowercase_letters: [char; 26] = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
const uppercase_letters: [char; 26] = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

function str_contains(str: [char; 16], contents: [char; 8]) -> bool {
    let count: i32 = 0;
    let content_padding = ['0';8];

    let  contents = [...contents, ...content_padding];
    for i in 0..16 {
        if count < 8 {
            if str[i] == contents[count] {
                count += 1;
            } else {
                count = 0;
            }
        }
    }
    return count == 8;
}

function to_lower(str: [char; 16]) -> [char; 16] {
    let lowercase_string = ['0'; 16];
    let applied = false;

    for i in 0..16 {
        for j in 0..26 {
            if applied == false && str[i] == uppercase_letters[j] {
                lowercase_string[i] = lowercase_letters[j];
                applied = true;
            }
        }
        if applied == false {
            lowercase_string[i] = str[i];
        }
        applied = false;
    }

    return lowercase_string;
}

function to_upper(str: [char; 16]) -> [char; 16] {
    let uppercase_string = ['0'; 16];
    let applied = false;

    for i in 0..16 {
        for j in 0..26 {
            if applied == false && str[i] == lowercase_letters[j] {
                uppercase_string[i] = uppercase_letters[j];
                applied = true;
            }
        }
        if applied == false {
            uppercase_string[i] = str[i];
        }
        applied = false;
    }

    return uppercase_string;
}

function convert(str: [char; 16])


function capitalize(str: [char; 16]) -> [char; 16] {
    let upper_str = to_upper(str);
    let lower_str = to_lower(str);
    let capitalized_str = ['0'; 16];
    capitalized_str[0] = upper_str[0];
    capitalized_str[1..] = lower_str[1..];
    return capitalized_str;
}
