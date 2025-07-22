{ config, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
   onlyoffice-desktopeditors
   libreoffice-qt6-fresh
  ];
}
