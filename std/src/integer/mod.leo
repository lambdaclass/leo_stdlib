function mod(num: i32, divisor: i32) -> i32 {
    if num < 0 {
        num = -num;
    }

    if divisor < 0 {
        divisor = -divisor;
    }

    return num - (num / divisor * divisor);    
}

