{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    python3
    uv
    python313Packages.pip
    cargo
    rustup
    rustc
    gcc
    cmake
    nodejs
    go
    bun

  ]
;

  services.flatpak = {
    enable = true;
    packages = [
      "io.dbeaver.DBeaverCommunity"
    ];
  };

  virtualisation.docker.enable = true;
}
