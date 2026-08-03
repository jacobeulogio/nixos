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

    limine.extraEntries = '' 
      /Windows
        protocol: efi
        path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
    '';

  };

  environment.systemPackages = with pkgs; [
    sbctl
    efibootmgr
  ];


  system.stateVersion = "25.05";
}

