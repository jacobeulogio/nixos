{
  pkgs,
  inputs,
  ...
}:
{
  programs.zsh = {
    enable = true;
  };

  # nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlays.default ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    # plugins = with pkgs.vimPlugins; [
    #   nvim-treesitter
    # ];
  };

  environment.systemPackages = with pkgs; [
    # essentials
    git
    gh
    vim

    # dev
    gcc
    gnumake
    tree-sitter

    # terminal
    wezterm
    tmux
    zsh-powerlevel10k

    # utils
    atuin
    yazi
    stow
    wget
    curl
    tree
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
    qmk
    opencode
    parallel

    # work
    google-cloud-sdk
    scrcpy
    duckdb
    terraform
    terraformer
  ];

  virtualisation.docker.enable = true;
}
