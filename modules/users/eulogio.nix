{ config, pkgs, lib, ... }: { 

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

  home-manager.users.eulogio = {
    imports = [ ];

    programs = {

      git = {
        enable = true;
        userName = "jacobeulogio";
        userEmail = "benitezjacob35@gmail.com";
      };

      btop = {
        enable = true;
        settings.vim_keys = true;
      };

      direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
      };

    };

    home.stateVersion = "25.05";
  };

}
