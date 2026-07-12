{
  pkgs,
  lib,
  ...
}:
{


  # Bootloader
  boot.loader = {
    systemd-boot.enable = lib.mkForce false;
    limine.enable = true;
  };

  environment.systemPackages = with pkgs; [
    sbctl
    efibootmgr
  ];


  system.stateVersion = "25.05";
}

