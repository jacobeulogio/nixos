{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
  };
  users.defaultUserShell = pkgs.zsh;

  programs.nix-ld.enable = true;
  environment.localBinInPath = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    # Core Utils
    git gh
    vim
    atuin yazi stow 
    wget curl
    btop tree wl-clipboard
    fzf fd ripgrep zoxide
    p7zip unzip ffmpeg jq poppler resvg imagemagick
    steam-run

    # Dev
    python3 uv ruff python313Packages.pip
    cargo rust-analyzer rustup
    gcc cmake
    lua-language-server stylua
    nodejs
    gemini-cli
    go gopls
    
    # Terminal and Tmux
    wezterm tmux 

    # Zsh
    zsh-powerlevel10k oh-my-zsh

    # Browsers
    qutebrowser python313Packages.adblock vivaldi
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.geist-mono
  ];
  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;

  hardware.keyboard.qmk.enable = true;
  services.udev.packages = with pkgs; [ 
    via
    vial
  ];
  
  services.flatpak.enable = true; 
  services.flatpak.packages = [
    "io.dbeaver.DBeaverCommunity"
  ];

  virtualisation.docker.enable = true;
}
