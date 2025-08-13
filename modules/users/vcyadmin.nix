{ config, pkgs, lib, ... }: { 

  users.users.vcyadmin = {
    isNormalUser = true;
    description = "vcyadmin";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "docker"
    ];
    packages = with pkgs; [
      vim
      git
      gh
      curl
    ];
  };

  networking.hostName = "nixos-postgres";
}
