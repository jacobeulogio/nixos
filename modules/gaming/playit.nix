{
  pkgs,
  config,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    playit-nixos-module.nixosModules.default
  ];

  services.playit = {
    enable = true;
    secretPath = "~/Games/playit.toml";
  };

}
