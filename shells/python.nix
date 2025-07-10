{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSEnv {
  name = "pipzone";
  targetPkgs = pkgs: (with pkgs; [
    python314
    python314Packages.pip
    python314Packages.virtualenv
  ]);
  runScript = "zsh";
}).env
