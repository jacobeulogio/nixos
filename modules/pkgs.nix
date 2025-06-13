{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
  };

  programs.nix-ld.enable = true;

  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    git
    gh
    stow
    atuin
    yazi
    vim
    neovim

    nix-ld
    nodejs
    rust-analyzer
    python3
    uv
    cargo
    rustup
    gcc
    wget
    curl
    cmake
    ruff
    lua-language-server
    stylua

    fzf
    fd
    p7zip
    unzip
    wl-clipboard
    btop
    zoxide
    linuxKernel.packages.linux_zen.cpupower

    wezterm
    tmux

    zsh-powerlevel10k
    oh-my-zsh

    qutebrowser
    vivaldi
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    nerd-fonts.jetbrains-mono
  ];
}
