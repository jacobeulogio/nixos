{ config, pkgs, chaotic, ... }: {

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # chaotic.mesa-git.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    goverlay
    discord
  ];
}
