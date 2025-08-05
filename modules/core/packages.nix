{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
  };

  programs.nix-ld.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  nixpkgs.overlays = [
    (import (
      builtins.fetchTarball {
        url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
        sha256 = "0vmvqia5fnqpbrqnvbzwwkqwvvw45fmfcdr274fj688zzxrbwp4g";
      }
    ))
  ];

  environment.systemPackages = with pkgs; [
    git
    gh
    vim
    atuin
    yazi
    stow
    wget
    curl
    tree
    wl-clipboard
    fzf
    fd
    ripgrep
    zoxide
    p7zip
    unzip
    ffmpeg
    jq
    poppler
    resvg
    imagemagick
    openssl

    # Dev
    python3
    uv
    python313Packages.pip
    cargo
    rustup
    rustc
    gcc
    cmake
    nodejs
    gemini-cli
    go

    # LSP
    ruff
    python313Packages.python-lsp-server
    rust-analyzer
    lua-language-server
    stylua
    gopls
    nil

    # Terminal and Tmux
    wezterm
    tmux

    # Zsh
    zsh-powerlevel10k
    oh-my-zsh

    # Browsers
    qutebrowser
    python313Packages.adblock
    vivaldi

    vial
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.geist-mono
  ];

  services.udev.packages = with pkgs; [
    via
    vial
  ];

  services.flatpak = {
    enable = true;
    packages = [
      "io.dbeaver.DBeaverCommunity"
    ];
  };

  virtualisation.docker.enable = true;
}
