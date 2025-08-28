{
  lib,
  ...
}:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [
    "ata_piix"
    "mptspi"
    "sd_mod"
    "sr_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/21524868-f6ba-484d-9b3c-fdcae773cb13";
    fsType = "ext4";
  };

  # ===============================

  boot.loader = {
    grub = {
      enable = lib.mkForce true;
      device = lib.mkForce "/dev/sda";
      useOSProber = lib.mkForce true;
    };
    systemd-boot = lib.mkForce false;
    efi.canTouchEfiVariables = lib.mkForce false;
  };

  networking = {
    hostName = "eulogio-bth"; 
    networkmanager.enable = true;
    useDHCP = false;
    interfaces.ens160 = {
      ipv4.addresses = [
        {
          address = "192.168.102.64";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = "192.168.102.254";
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];
  };

  # networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ 22 ];

  # ===============================

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
