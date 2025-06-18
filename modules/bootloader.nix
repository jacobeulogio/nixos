{ config, pkgs, ... }:

{
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_cachyos;

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
  };

  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
}
