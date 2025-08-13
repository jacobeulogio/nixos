{pkgs, lib , ...}: 
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
  ];
}
