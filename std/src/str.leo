const lowercase_letters: [char; 26] = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
const uppercase_letters: [char; 26] = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

function contains(str: [char; 16], contents: [char; 8]) -> bool {
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
    return convert(str, false);
}

function to_upper(str: [char; 16]) -> [char; 16] {
    return convert(str, true);
}

function capitalize(str: [char; 16]) -> [char; 16] {
    let capitalized_str = ['0'; 16];

    // Capitalize first char
    for i in 0..26 {
        if str[0] == lowercase_letters[i] {
            str[0] = uppercase_letters[i];
        }
    }
    capitalized_str[0] = str[0];

    // Capitalize the rest of the string
    capitalized_str[1..] = substring_to_lower(str[1..]);
    return capitalized_str;
}


// Auxiliary functions
function convert(str: [char; 16], lower_to_upper: bool) -> [char; 16] {
    let converted_string = ['0'; 16];
    let applied = false;
    
    let origin = ['0'; 26];
    let target = ['0'; 26];
    if lower_to_upper {
        origin = lowercase_letters;
        target = uppercase_letters;
    } else {
        origin = uppercase_letters;
        target = lowercase_letters;
    }

    for i in 0..16 {
        for j in 0..26 {
            if applied == false && str[i] == origin[j] {
                converted_string[i] = target[j];
                applied = true;
            }
        }
        if applied == false {
            converted_string[i] = str[i];
        }
        applied = false;
    }
    return converted_string;
}

function substring_to_lower(substr: [char; 15]) -> [char; 15] {
    let converted_substring = ['0'; 15];
    let applied = false;

    for i in 0..15 {
        for j in 0..26 {
            if applied == false && substr[i] == uppercase_letters[j] {
                converted_substring[i] = lowercase_letters[j];
                applied = true;
            }
        }
        if applied == false {
            converted_substring[i] = substr[i];
        }
        applied = false;
    }
    return converted_substring;
}
