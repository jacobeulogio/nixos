{ pkgs, ... }:

{
  home-manager.users.eulogio = {

      # home.packages = with pkgs; [
      #   droidcam
      #   obs-studio
      # ];

    home.stateVersion = "25.05";
  };
}
