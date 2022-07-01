// The 'error-if-return' main function.
circuit CustomType{
    value: u32

    function static_equals(lhs: Self, rhs: Self) -> bool{
        return lhs.value == rhs.value;
    }

    function equals(self, rhs: Self) -> bool{
        return self.value == rhs.value;
    }

    function operate(self, rhs: Self) -> Self {
        if(self.equals(rhs)){
            return Self { value: 0};
        } else {
            return Self { value: 1};
        }
    }
}
function main(a: u32, b: u32) -> u32 {
    let c: u32 = a + b;
    return c;
}
