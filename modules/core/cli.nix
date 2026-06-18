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
    aria2
    btop

    # Lsp for nvim 
    ruff
    python313Packages.python-lsp-server
    rust-analyzer
    lua-language-server
    stylua
    gopls
    nil
    beautysh
    prettier
  ];

}
