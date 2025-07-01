{ config, pkgs, ... }: {

  programs.zsh = {
    enable = true;
  };

  programs.nix-ld.enable = true;

  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [

    # Core Utils
    git gh
    vim neovim
    wget curl
    btop 
    fzf fd ripgrep zoxide tree 
    p7zip unzip 
    atuin yazi stow 
    wl-clipboard
    nix-ld

    # Dev
    python3 uv ruff python313Packages.pip
    cargo rust-analyzer rustup
    gcc cmake
    lua-language-server stylua
    nodejs
    dbeaver-bin

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
  ];

  # Docker
  virtualisation.docker.enable = true;
}
