{
  description = "My config";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    chaotic = { url = "github:chaotic-cx/nyx/nyxpkgs-unstable"; };
    nix-flatpak = { url = "github:gmodena/nix-flatpak"; };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
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
      mkUser = user: ./modules/users/${user}.nix;
      mkHost = host: ./hosts/${host}.nix;

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
      work = [
        ./modules/work/home.nix
        ./modules/work/packages.nix
      ];
      chaoticNyx = [
        chaotic.nixosModules.nyx-cache
        chaotic.nixosModules.nyx-overlay
        chaotic.nixosModules.nyx-registry
        ];
    in
    {
      nixosConfigurations = {
        eulogio = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = core ++ gui ++ chaoticNyx ++ [
            (mkUser "eulogio")
            (mkHost "eulogio")
            ./modules/personal/games.nix
            ./modules/personal/laptop_amd.nix
          ];
        };

        thd = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = core ++ gui ++ work ++ [
            (mkUser "eulogio")
            (mkHost "thd") 
            ./modules/work/postgres.nix
          ];
        };

        bth = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = core ++ gui ++ work ++ [
            (mkHost "bth") 
            (mkUser "eulogio")
          ];
        };

        server-postgres = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = core ++ [
            (mkHost "server-postgres") 
            (mkUser "vcyadmin")
            ./modules/work/postgres.nix
            ./modules/work/monitoring.nix
          ];
        };

        server-airflow = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = core ++ [
            (mkHost "server-airflow") 
            (mkUser "vcyadmin")
          ];
        };

      };
    };
}
