{
  pkgs,
  lib,
  ...
}:
{

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      rime-data
      fcitx5-gtk
      fcitx5-rime
    ];
  };

  environment.systemPackages = with pkgs; [
    kdePackages.fcitx5-configtool
  ];

  system.stateVersion = "25.05";
}
