{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    spotify
    qbittorrent-enhanced
    slack
    hubstaff
    gimp3
    ventoy
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-1.1.07"
  ];

}
