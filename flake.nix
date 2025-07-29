{
  description = "My config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { self, nixpkgs, chaotic, nix-flatpak, home-manager, ... }:
    let
      commonModules = [
        ./modules/core/packages.nix
        ./modules/core/settings.nix
        ./modules/core/hyprland.nix
        ./modules/core/home.nix
        nix-flatpak.nixosModules.nix-flatpak
        home-manager.nixosModules.home-manager
      ];
    in
    {
      nixosConfigurations = {

        eulogio = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = commonModules ++ [
            ./hosts/eulogio.nix
            ./modules/games.nix
            ./modules/laptop_amd.nix
            chaotic.nixosModules.nyx-cache
            chaotic.nixosModules.nyx-overlay
            chaotic.nixosModules.nyx-registry
          ];
        };

        thd = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = commonModules ++ [
            ./hosts/thd.nix
            ./modules/work/home.nix
            ./modules/work/packages.nix
            ./modules/work/postgres.nix
            ./modules/work/kafka.nix
          ];
        };

        bth = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = commonModules ++ [
            ./hosts/bth.nix
            ./modules/work/home.nix
            ./modules/work/packages.nix
            ./modules/work/kafka.nix
          ];
        };
      };
    };
}
