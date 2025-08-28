{
  pkgs,
  lib,
  ...
}:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Nix
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 15d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  # Env
  environment = {
    variables = {
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
      OPENSSL_DIR = "${pkgs.openssl.dev}";
      OPENSSL_NO_VENDOR = 1;
      OPENSSL_LIB_DIR = "${pkgs.lib.getLib pkgs.openssl}/lib";
    };
    sessionVariables = {
      PATH = "$PATH:$HOME/nixos/scripts";
    };
    localBinInPath = true;
  };

  # Bootloader
  boot.loader = {
    systemd-boot.enable = lib.mkDefault true;
    grub = {
      enable = lib.mkDefault false;
      efiSupport = lib.mkDefault false;
    };
    efi.canTouchEfiVariables = lib.mkDefault true;
  };

  # Timezone and Locale
  time.timeZone = "Asia/Manila";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_PH.UTF-8";
    LC_IDENTIFICATION = "en_PH.UTF-8";
    LC_MEASUREMENT = "en_PH.UTF-8";
    LC_MONETARY = "en_PH.UTF-8";
    LC_NAME = "en_PH.UTF-8";
    LC_NUMERIC = "en_PH.UTF-8";
    LC_PAPER = "en_PH.UTF-8";
    LC_TELEPHONE = "en_PH.UTF-8";
    LC_TIME = "en_PH.UTF-8";
  };


  # Hardware Settings
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    #media-session.enable = true;
  };
  hardware.keyboard.qmk.enable = true;

  services.xserver = {
    enable = true;
    xkb.options = "caps:swapescape";
  };

  # SSH and Network
  services.openssh.enable = true;
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  fonts = {
    fontDir.enable = true;
    fontconfig.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  system.stateVersion = "25.05";
}
