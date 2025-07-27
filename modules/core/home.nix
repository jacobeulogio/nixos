{
  home-manager.users.eulogio = {
    imports = [
    ];

    programs.git = {
      enable = true;
      userName = "jacobeulogio";
      userEmail = "benitezjacob35@gmail.com";
    };

    programs.btop = {
      enable = true;
      settings.vim_keys = true;
    }

    home.stateVersion = "25.05";
  };
}
