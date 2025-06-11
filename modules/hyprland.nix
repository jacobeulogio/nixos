{
  config,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    rofi-wayland
    waybar
    nwg-look
    pavucontrol
    blueman
    networkmanagerapplet
    cliphist
    swaynotificationcenter
    rofi-wayland
    papirus-icon-theme
    hyprpaper
    waybar
    xdg-desktop-portal-hyprland
    grim
    slurp
  ];
}
