{
  pkgs,
  inputs,
  ...
}:
{
  programs.zsh = {
    enable = true;
  };

  programs.nix-ld.enable = true;

  nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlays.default ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    # Cli
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
    oh-my-zsh

    # Gui
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
