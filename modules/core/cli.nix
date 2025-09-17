{
  pkgs,
  inputs,
  ...
}:
{
  programs.zsh = {
    enable = true;
  };

  nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlays.default ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

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
    wezterm
    tmux
    zsh-powerlevel10k
    opencode
    qmk
    # (pkgs.callPackage ../../packages/opencode.nix { })
  ];
}
