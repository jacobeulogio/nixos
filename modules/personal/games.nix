{
  config,
  pkgs,
  chaotic,
  ...
}:
{

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.gamemode.enable = true;
  # chaotic.mesa-git.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    goverlay
    discord

    wine-wayland
    winetricks
    wineWow64Packages.stable

    lutris
    protonup-qt
    heroic
    protontricks

    ftb-app
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.videoDrivers = [ "amdgpu" ];

}
