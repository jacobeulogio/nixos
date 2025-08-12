{
  description = "My config";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    chaotic = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
    };

  };

  outputs =
    inputs@{
      nixpkgs,
      chaotic,
      nix-flatpak,
      home-manager,
      neovim-nightly-overlay,
      ...
    }:
    let
      commonModules = [
        ./modules/core/packages.nix
        ./modules/core/dev.nix
        ./modules/core/settings.nix
        ./modules/core/hyprland.nix
        ./modules/core/home.nix
        nix-flatpak.nixosModules.nix-flatpak
        home-manager.nixosModules.home-manager
        { _module.args = { inherit inputs; }; }
      ];
    in
    {
      nixosConfigurations = {

        eulogio = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = commonModules ++ [
            ./hosts/eulogio.nix
            ./modules/personal/games.nix
            ./modules/personal/laptop_amd.nix
            ./modules/personal/home.nix
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
            # ./modules/work/kafka.nix
          ];
        };

        bth = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = commonModules ++ [
            ./hosts/bth.nix
            ./modules/work/home.nix
            ./modules/work/packages.nix
            ./modules/work/postgres/bth.nix
            # ./modules/work/kafka.nix
          ];
        };
      };
    };
}
