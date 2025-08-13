{ config, pkgs, lib }: { 

  users.users.eulogio = {
    isNormalUser = true;
    description = "Eulogio";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "docker"
    ];
  };
    
  users.defaultUserShell = pkgs.zsh;

  networking.hostName = "eulogio";

}
