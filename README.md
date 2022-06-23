# Leo Standard Library

Standard library for the Leo Language

## How to use

To use the project you need to have [nix](https://nix.dev/tutorials/install-nix) installed.

To get into the nix-shell, use:

`nix-shell`

If it's your first time using this project:

`make init`

To build the project:

`make build`

To run the tests:

`make test`

# Documentation

This is a preliminary documentacion. [MkDocs](https://www.mkdocs.org/) will be use for proper documentation.

## Array

### Functions

## Hashing

### Functions
```
poseidon(field1: field, field2: field) -> field
```
Poseidon hashing fucction for fields.
Takes 2 fields as inputs and generates one output, to use in binary merkle trees.

These implementation is based on the Poseidon RS implementation, which itself is based in the 
[sage reference implementation](https://extgit.iaik.tugraz.at/krypto/hadeshash/-/blob/master/code/poseidonperm_x5_254_3.sage)
    
The Constants are generated for bls 12 377 using [this reference](https://extgit.iaik.tugraz.at/krypto/hadeshash/-/blob/master/code/generate_parameters_grain.sage)

```
get_markle_root(fields_array: [field;8]) -> field
```
Computes a merkle root from an fixed 8 element array of fields.
This implementation uses the poseidon algorithm for hashing.

## Integer

### Functions

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

## String

### Functions


