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

  systemd.user.services.steam-bigpicture = {
    enable = true;
    description = "Steam Big Picture";

    # Only start after Hyprland / the graphical session is ready
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.steam}/bin/steam -gamepadui -steamos3";
      Restart = "on-failure";
      RestartSec = "5s";
    };
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

    # lossless scaling
    lsfg-vk
    lsfg-vk-ui

  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

}
