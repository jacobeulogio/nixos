{ pkgs, ... }:
{

  # Gnome
  services.displayManager.gdm = {
    enable = true;
    wayland = true;
    autoSuspend = false;
  };

  services.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    qutebrowser python313Packages.adblock
    vivaldi
    vial
    mpv
    vlc
    # zoom-us
  ];

  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
    plugins = with pkgs.obs-studio-plugins; [
      droidcam-obs
    ];
  };

  # Defaults
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "default-web-browser" = "org.qutebrowser.qutebrowser.desktop";
      "text/html" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/about" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/unknown" = "org.qutebrowser.qutebrowser.desktop";
    };
  };

  environment.sessionVariables = {
    BROWSER = "qutebrowser";
  };

  services.flatpak = {
    enable = true;
    packages = [
      "io.dbeaver.DBeaverCommunity"
    ];
  };

  services.udev.packages = with pkgs; [
    via
    vial
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.geist-mono
  ];


}
