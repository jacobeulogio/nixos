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
    {
      nixpkgs,
      chaotic,
      nix-flatpak,
      home-manager,
      neovim-nightly-overlay,
      ...
    }@inputs:
    let

      userModule = user: ./modules/users/${user}.nix;

      core = [
        ./modules/core/cli.nix
        ./modules/core/settings.nix
        home-manager.nixosModules.home-manager
        { _module.args = { inherit inputs; }; }
      ];
      gui = [
        ./modules/core/dev.nix
        ./modules/core/gui.nix
        ./modules/core/packages.nix
        ./modules/core/hyprland.nix
        nix-flatpak.nixosModules.nix-flatpak
      ];
    in
    {
      nixosConfigurations = {
        eulogio = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = core ++ gui ++ [
            (userModule "eulogio")
            ./hosts/eulogio.nix
            ./modules/users/eulogio.nix
            ./modules/personal/games.nix
            ./modules/personal/laptop_amd.nix
            chaotic.nixosModules.nyx-cache
            chaotic.nixosModules.nyx-overlay
            chaotic.nixosModules.nyx-registry
          ];
        };

        thd = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = core ++ gui ++ [
            (userModule "eulogio")
            ./hosts/thd.nix
            ./modules/users/eulogio.nix
            ./modules/work/home.nix
            ./modules/work/packages.nix
            ./modules/work/postgres.nix
          ];
        };

        bth = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = core ++ gui ++ [
            (userModule "eulogio")
            ./hosts/bth.nix
            ./modules/users/eulogio.nix
            ./modules/work/home.nix
            ./modules/work/packages.nix
          ];
        };

        server-postgres = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = core ++ [
            (userModule "vcyadmin")
            ./hosts/server-postgres.nix
            ./modules/users/vcyadmin.nix
            ./modules/work/postgres.nix
            ./modules/work/monitoring.nix
          ];
        };

      };
    };
}
