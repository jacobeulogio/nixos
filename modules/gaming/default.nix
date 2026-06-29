{
  pkgs,
  # chaotic,
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
    # goverlay
    discord

    wine-wayland
    winetricks
    wineWow64Packages.stable


    faugus-launcher
    lutris
    protonup-qt
    protonplus
    heroic
    protontricks

    # lossless scaling
    lsfg-vk
    lsfg-vk-ui

    lact
  ];
    
  services.flatpak = {
    enable = true;
    packages = [
      "io.github.benjamimgois.goverlay"
    ];
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
}
