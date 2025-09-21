{
  pkgs,
  lib,
  config,
}:
{
  environment.systemPackages = with pkgs; [
    spotify
    qbittorrent-enhanced
    slack
    hubstaff
  ];

}
