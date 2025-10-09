{
  pkgs,
  ...
}:
{
  services.udev.packages = with pkgs; [
    via
    vial
  ];

  services.flatpak = {
    enable = true;
    packages = [
      "io.dbeaver.DBeaverCommunity"
    ];
  };
}
