{
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
