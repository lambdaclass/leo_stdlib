function capitalize(str: [char; 16]) -> [char; 16] {
    let lowercase_letters: [char; 26] = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
    let uppercase_letters: [char; 26] = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

    let capitalized_str = ['0';16];
    for i in 0..26 {
        if str[0] == lowercase_letters[i] || str[0] == uppercase_letters[i] {
            capitalized_str[0] = uppercase_letters[i];                    
        }            
    }

    let capitalized = false;

    for i in 1..16 {
        for j in 0..26 {
            if str[i] == uppercase_letters[j] && capitalized == false {
                capitalized_str[i] = lowercase_letters[j];
                capitalized = true;
            } else if capitalized == false {
                capitalized_str[i] = str[i];
            }
        }
        capitalized = false;
    }

    return capitalized_str;
}
