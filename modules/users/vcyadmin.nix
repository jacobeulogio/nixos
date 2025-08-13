{
  config,
  pkgs,
  lib,
  ...
}:
{

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

  home-manager.users.vcyadmin = {

    programs = {
      git = {
        userName = "jacobbenitez";
        userEmail = "jacob.benitez@triumphhomedepot.com";
      };

      btop = {
        enable = true;
        settings.vim_keys = true;
      };
    };
  };
}
