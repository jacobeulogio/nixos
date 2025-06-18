{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
  };

  programs.nix-ld.enable = true;

  users.defaultUserShell = pkgs.zsh;

  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = ["*"]; 
      settings = {
        main = {
          capslock = "home";
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    # Main
    git gh
    atuin yazi stow 
    vim neovim
    nix-ld

    # Languages
    nodejs
    python3 uv ruff python313Packages.pip
    cargo rust-analyzer rustup
    gcc cmake
    wget curl
    lua-language-server stylua

    # Misc
    btop fzf fd zoxide tree 
    p7zip unzip
    wl-clipboard
    linuxKernel.packages.linux_zen.cpupower

    # Terminal and Tmux
    wezterm tmux python313Packages.libtmux 

    # Zsh
    zsh-powerlevel10k oh-my-zsh

    # Browsers
    qutebrowser python313Packages.adblock vivaldi
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
