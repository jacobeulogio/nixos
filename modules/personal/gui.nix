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
    netflix
  ];

}
