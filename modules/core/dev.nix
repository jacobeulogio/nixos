{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    python3
    uv
    python313Packages.pip
    cargo
    rustup
    rustc
    gcc
    cmake
    nodejs
    go
    bun

    # Lsp
    ruff
    python313Packages.python-lsp-server
    rust-analyzer
    lua-language-server
    stylua
    gopls
    nil
    beautysh
    nodePackages_latest.prettier
  ]
;
}
