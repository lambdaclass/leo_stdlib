import integer.mod.mod;

function gcd(a: i32, b: i32) -> i32 {
    let result: i32 = (a > b) ? b : a; //el minimo entre a y b
    for i in 0..10000 {
        if  !((result <= 0) || ((mod(a, result) == 0) && (mod(b, result) == 0))){
            result -= 1;
        }
    }
    return result;
}
