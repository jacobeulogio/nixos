{ pkgs, ... }:

{
  home-manager.users.eulogio = {

      home.packages = with pkgs; [
        discord
      ];

    home.stateVersion = "25.05";
  };
}
