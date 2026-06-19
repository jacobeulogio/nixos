{
  description = "My config";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nixpkgs-stable = {
      url = "github:nixos/nixpkgs/nixos-26.05";
    };
    chaotic = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    };
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-preview-share-picker = {
      url = "git+https://github.com/WhySoBad/hyprland-preview-share-picker";
      # You may optionally override the nixpkgs input to save space.
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
        inputs.noctalia-greeter.nixosModules.default
        { _module.args = { inherit inputs; }; }
      ];

      gui = [
        ./modules/core/gui.nix
        ./modules/core/hyprland.nix
        nix-flatpak.nixosModules.nix-flatpak
      ];

      dev = [
        ./modules/core/dev.nix
      ];

      chaoticNyx = [
        chaotic.nixosModules.default
      ];
    in
    {
      nixosConfigurations = {
        eulogio = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules =
            core
            ++ gui
            ++ dev
            ++ [
              (mkUser "eulogio")
              (mkHost "eulogio")
              ./modules/laptop
              ./modules/gaming
              ./modules/work
            ];
        };

        eulogio-pc = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules =
            core
            ++ gui
            ++ chaoticNyx
            ++ [
              (mkUser "eulogio")
              (mkHost "eulogio-pc")
              ./modules/gaming
              ./modules/gaming/steam_bigpicture.nix
            ];
        };

        # thd = nixpkgs.lib.nixosSystem {
        #   system = "x86_64-linux";
        #   modules = core ++ gui ++ work ++ [
        #     (mkUser "eulogio")
        #     (mkHost "thd")
        #     ./modules/work/postgres.nix
        #   ];
        # };
        #
        # bth = nixpkgs.lib.nixosSystem {
        #   system = "x86_64-linux";
        #   modules = core ++ gui ++ work ++ [
        #     (mkHost "bth")
        #     (mkUser "eulogio")
        #   ];
        # };
        #
        # server-postgres = nixpkgs.lib.nixosSystem {
        #   system = "x86_64-linux";
        #   modules = core ++ [
        #     (mkHost "server-postgres")
        #     (mkUser "vcyadmin")
        #     ./modules/work/postgres.nix
        #     ./modules/work/monitoring.nix
        #   ];
        # };
        #
        # server-airflow = nixpkgs.lib.nixosSystem {
        #   system = "x86_64-linux";
        #   modules = core ++ [
        #     (mkHost "server-airflow")
        #     (mkUser "vcyadmin")
        #   ];
        # };

      };
    };
}
