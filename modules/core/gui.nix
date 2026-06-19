{ pkgs, inputs, ... }:
{

  # Gnome
  services.displayManager.gdm = {
    enable = true;
    autoSuspend = false;
  };

  # programs.noctalia-greeter = {
  #   enable = true;
  #   package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;
  #
  #   # Optional configuration
  #   greeter-args = "";
  #   settings.cursor = {
  #     theme = "Adwaita";
  #     size = 24;
  #     package = pkgs.adwaita-icon-theme;
  #   };
  # };

  services.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    # Browsers
    qutebrowser
    python313Packages.adblock
    imwheel
    vivaldi

    # Custom Keybaords
    vial

    # Media
    mpv
    vlc
    spotify
    netflix
    gimp3

    # Other
    qbittorrent-enhanced
    ventoy
  ];

  services.flatpak = {
    enable = true;
    packages = [
    ];
  };

  nixpkgs.config = {
    permittedInsecurePackages = [
      "ventoy-1.1.12"
    ];
  };

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

  services.udev.packages = with pkgs; [
    via
    vial
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    nerd-fonts.geist-mono
    nerd-fonts.jetbrains-mono
  ];

}
