
{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    git
    gh

    vim 
    neovim

    python3
    uv

    cargo
    rustup
    gcc
    wget
    curl
    cmake

    stow
    atuin
    yazi 
    fzf
    fd
    p7zip

    wezterm
    tmux

    zsh-powerlevel10k
    oh-my-zsh
    
    qutebrowser
    vivaldi
    wl-clipboard
    btop
    zoxide
  ];
}
