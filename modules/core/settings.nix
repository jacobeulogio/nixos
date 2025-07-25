{ config, pkgs, ... }:
{
  users.defaultUserShell = pkgs.zsh;

  environment.localBinInPath = true;

  hardware.keyboard.qmk.enable = true;

  services.flatpak.enable = true; 

  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;
}
