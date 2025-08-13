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

    programs =  {
      git = {
        userName = lib.mkForce "jacobbenitez";
        userEmail = lib.mkForce "jacob.benitez@triumphhomedepot.com";
      };

      btop = {
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
