{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
  };
  users.defaultUserShell = pkgs.zsh;

  programs.java = { 
    enable = true;
  };

  services.flatpak.enable = true; 

  programs.nix-ld.enable = true;
  environment.localBinInPath = true;

  environment.systemPackages = with pkgs; [
    # Core Utils
    git gh
    vim neovim
    wget curl
    btop 
    fzf fd ripgrep zoxide tree 
    p7zip unzip ffmpeg jq poppler resvg imagemagick
    atuin yazi stow 
    wl-clipboard
    nix-ld
    steam-run

    # Dev
    python3 uv ruff python313Packages.pip
    cargo rust-analyzer rustup
    gcc cmake
    lua-language-server stylua
    nodejs
    jdk21
    gemini-cli
    
    # Terminal and Tmux
    wezterm tmux python313Packages.libtmux 

    # Zsh
    zsh-powerlevel10k oh-my-zsh

    # Browsers
    qutebrowser python313Packages.adblock vivaldi
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.commit-mono
    nerd-fonts.geist-mono
  ];
  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;

  hardware.keyboard.qmk.enable = true;
  services.udev.packages = with pkgs; [ 
    via
    vial
  ];
  
  virtualisation.docker.enable = true;
}
