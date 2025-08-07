{
  config,
  pkgs,
  ...
}:
{
  programs.zsh = {
    enable = true;
  };

  programs.nix-ld.enable = true;

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
    go
    gemini-cli
    opencode
    bun

    # LSP
    ruff
    python313Packages.python-lsp-server
    rust-analyzer
    lua-language-server
    stylua
    gopls
    nil
    beautysh

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
