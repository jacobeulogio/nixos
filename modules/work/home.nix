
{ pkgs, lib, ... }: {

  home-manager.users.eulogio = {
    home.packages = with pkgs; [
      kubectl
      docker
    ];

    home.sessionVariables = {
      GOOGLE_CLOUD_PROJECT = "dashboard-441809";
    };

    programs.git = {
      userName = lib.mkForce "jacobbenitez";
      userEmail = lib.mkForce "jacob.benitez@triumphhomedepot.com";
    };
  };

}
