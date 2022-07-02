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
        if self.equals(rhs) {
            return Self { value: 0};
        } else {
            return Self { value: 1};
        }
    }
}

// All the code in the tests do the same
// yet when using nesting functions without different variables
// it gives a different result

@test 
function operation_with_equals_and_nested_function_test() {
    let rhs = CustomType{ value: 1};
    let lhs = CustomType{ value: 0};
    let expected_result = CustomType{ value: 1};
    console.assert(expected_result.equals(lhs.operate(rhs)));
}

@test 
function operation_with_intermediate_variable_and_equals_test() {
    let rhs = CustomType{ value: 1};
    let lhs = CustomType{ value: 0};
    let expected_result = CustomType{ value: 1};
    let result = lhs.operate(rhs);
    console.assert(expected_result.equals(result));
}

@test 
function operation_test() {
    let rhs = CustomType{ value: 1};
    let lhs = CustomType{ value: 0};
    let expected_result = CustomType{ value: 1};
    console.assert(lhs.operate(rhs).value == 1);
}

@test 
function operation_with_static_equals_test() {
    let rhs = CustomType{ value: 1};
    let lhs = CustomType{ value: 0};
    let expected_result = CustomType{ value: 1};
    console.assert(CustomType::static_equals(expected_result,lhs.operate(rhs)));
}
