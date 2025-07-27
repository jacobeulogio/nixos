
{ pkgs, lib, ... }: {
  home-manager.users.eulogio = {
    home.packages = with pkgs; [
      kubectl
      docker
    ];

    programs.git = {
      userName = lib.mkForce "jacobbenitez";
      userEmail = lib.mkForce "jacob.benitez@triumphhomedepot.com";
    };
  };
}
