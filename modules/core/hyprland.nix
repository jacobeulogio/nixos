{
  pkgs,
  inputs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    hyprpicker
    wl-clipboard
    waybar
    nwg-look
    pavucontrol
    blueman
    networkmanagerapplet
    cliphist
    swaynotificationcenter
    rofi
    papirus-icon-theme
    hyprpaper
    waybar
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    grim
    slurp
    libsForQt5.qt5ct
    qt5.qtwayland
    kdePackages.qt6ct
    kdePackages.qtwayland
    libnotify
    brightnessctl

    # noctalia
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
