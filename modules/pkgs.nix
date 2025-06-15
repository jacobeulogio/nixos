{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
  };

  programs.nix-ld.enable = true;

  users.defaultUserShell = pkgs.zsh;

  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = ["*"]; # Applies to all keyboards
      settings = {
        main = {
          # Remap Caps Lock to Home
          capslock = "home";
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    git gh
    atuin yazi
    vim neovim
    nix-ld
    nodejs
    python3 uv ruff python313Packages.pip
    cargo rust-analyzer rustup
    gcc cmake
    wget curl
    lua-language-server stylua
    btop fzf fd zoxide stow
    p7zip unzip
    wl-clipboard
    linuxKernel.packages.linux_zen.cpupower
    wezterm tmux python313Packages.libtmux 
    zsh-powerlevel10k oh-my-zsh
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
