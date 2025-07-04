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
    # Core Utils
    git gh
    vim neovim
    wget curl
    btop 
    fzf fd ripgrep zoxide tree 
    p7zip unzip 
    linuxKernel.packages.linux_zen.cpupower
    atuin yazi stow 
    wl-clipboard
    nix-ld

    # Languages
    python3 uv ruff python313Packages.pip
    cargo rust-analyzer rustup
    gcc cmake
    lua-language-server stylua
    nodejs

    # Terminal and Tmux
    wezterm tmux python313Packages.libtmux 

    # Zsh
    zsh-powerlevel10k oh-my-zsh

    # Browsers
    qutebrowser python313Packages.adblock vivaldi

    via
    vial
  ];
  
  hardware.keyboard.qmk.enable = true;
  services.udev.packages = [ 
    pkgs.via
    pkgs.vial
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono
  ];
}
