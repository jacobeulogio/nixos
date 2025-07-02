
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    coreutils # Provides pwd, test, etc.
    gnugrep
    gnused
    gawk
    jdk8 # Ensure Java 8 is available in this shell
  ];

  shellHook = ''
    echo "Entering SAP GUI shell environment..."
  '';
}
