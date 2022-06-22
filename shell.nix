{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  inherit (lib) optional optionals;
  rust_overlay = import (builtins.fetchTarball https://github.com/oxalica/rust-overlay/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> { overlays = [ rust_overlay ]; };
in

mkShell {
  buildInputs = [
    git
    nixpkgs.rust-bin.stable.latest.default
  ]
  ++ optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
    # For file_system on macOS. 
    #Adds some libraries needed to compile the project in mac
    AppKit
  ]);
}