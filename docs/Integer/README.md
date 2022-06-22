# Integer Module

## Functions

```
is_even(integer: i32) -> i32
```
Determines if an integer is even.
Returns `true` if the given integer is an even number, otherwise it returns `false`.

```
is_odd(integer: i32) -> i32
```
Determines if an integer is odd.
Returns `true` if the given integer is an odd number, otherwise it returns `false`.

```
gcd(integer1: i32, integer2: i32) -> i32
```
Returns the greatest common divisor of the two given integers.

The greatest common divisor (GCD) of `integer1` and `integer2` is the largest positive integer that divides both `integer1` and `integer2` without leaving a remainder.

By convention, `gcd(0, 0)` returns `0`.

```
extended_gcd(integer1: i32, integer2: i32) -> (i32,i32,i32)
```
Returns the extended greatest common divisor of the two given integers.
This function uses the extended Euclidean algorithm to return a three-element tuple with the `gcd` and the coefficients `m` and `n` of Bézout's identity such that:

`gcd(a, b) = m*a + n*b`

By convention, `extended_gcd(0, 0)` returns `(0, 0, 0)`.

```
mod(dividend: i32, divisor: i32) ->  i32
```
Computes the modulo remainder of an integer division.
This function performs a division, which means that the result will always have the sign of the `divisor`.

```
parse(string: [char; n]) -> i32
```
Parses a text representation of an integer.
