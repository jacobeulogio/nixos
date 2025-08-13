{ lib, config, ... }:
let
  userList = [
    "eulogio"
    "vcyadmin"
  ];

  userConfig = {
    home.sessionPath = lib.mkForce [
      "$HOME/nixos/scripts"
    ];

    home.sessionVariables = { };

    programs = lib.mkForce {
      git = {
        userName = "jacobbenitez";
        userEmail = "jacob.benitez@triumphhomedepot.com";
      };

      btop = lib.mkForce {
        enable = true;
        settings.vim_keys = true;
      };
    };
  };
in
{
  home-manager.users = lib.genAttrs (builtins.filter (user: config.users.users ? ${user}) userList) (
    user: userConfig
  );
}
