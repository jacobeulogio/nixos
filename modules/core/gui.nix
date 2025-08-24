{ pkgs, ... }:
{

  # Gnome
  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  services.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    qutebrowser
    python313Packages.adblock
    vivaldi
    vial
    ztoom-us
    mpv
    vlc
  ];

  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
    plugins = with pkgs.obs-studio-plugins; [
      droidcam-obs
    ];
  };

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

}
