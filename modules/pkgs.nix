{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
  };

  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    git
    gh
    stow
    atuin
    yazi
    vim
    neovim
    #
    python3
    uv
    #
    cargo
    rustup
    gcc
    wget
    curl
    cmake
    #
    fzf
    fd
    p7zip
    unzip
    wl-clipboard
    btop
    zoxide
    #
    wezterm
    tmux
    #
    zsh-powerlevel10k
    oh-my-zsh
    #
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
