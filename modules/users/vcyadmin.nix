{
  pkgs,
  ...
}:
{
  users.users.vcyadmin = {
    description = "vcyadmin";
    # initialPassword = "password";
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

    home.stateVersion = "25.05";
  };
}
