{
  pkgs,
  ...
}:
{

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "eulogio";

  systemd.user.services.steam-bigpicture = {
    enable = true;
    description = "Steam Big Picture";

    # Only start after Hyprland / the graphical session is ready
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.steam}/bin/steam -gamepadui -steamos3";
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };

}
