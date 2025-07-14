{ config, pkgs, ... }: {

  programs.zsh = {
    enable = true;
  };

  programs.nix-ld.enable = true;

  users.defaultUserShell = pkgs.zsh;

  environment.localBinInPath = true;

  environment.systemPackages = with pkgs; [

    # Core Utils
    git gh
    vim neovim
    wget curl
    btop 
    fzf fd ripgrep zoxide tree 
    p7zip unzip ffmpeg jq poppler resvg imagemagick
    linuxKernel.packages.linux_zen.cpupower
    atuin yazi stow 
    wl-clipboard
    nix-ld

    # Languages
    python3 uv ruff python313Packages.pip 
    cargo rust-analyzer rustup
    gcc cmake
    lua-language-server stylua
    nodejs
    gemini-cli

    # Terminal and Tmux
    wezterm tmux 

    # Zsh
    zsh-powerlevel10k oh-my-zsh

    # Browsers
    qutebrowser python313Packages.adblock vivaldi

    via vial
  ];

  hardware.keyboard.qmk.enable = true;
  services.udev.packages = [ 
    pkgs.via
    pkgs.vial
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.commit-mono
  ];
  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;
}
