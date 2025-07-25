{
  description = "My config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = {
    self,
    nixpkgs,
    chaotic,
    nix-flatpak,
    ...
  }: {
    nixosConfigurations = {

      eulogio = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/eulogio/hardware.nix
          ./hosts/eulogio/configuration.nix
          ./modules/core/packages.nix
          ./modules/core/settings.nix
          ./modules/core/hyprland.nix
          ./modules/games.nix
          ./modules/laptop_amd.nix
          nix-flatpak.nixosModules.nix-flatpak
          chaotic.nixosModules.nyx-cache
          chaotic.nixosModules.nyx-overlay
          chaotic.nixosModules.nyx-registry
        ];
      };

      thd = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/work/thd/configuration.nix
          ./hosts/work/thd/hardware-configuration.nix
          ./modules/core/packages.nix
          ./modules/core/settings.nix
          ./modules/core/hyprland.nix
          ./modules/work/postgres.nix
          ./modules/work/packages.nix
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };

      bth = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/work/thd/configuration.nix
          ./hosts/work/thd/hardware-configuration.nix
          ./modules/core/packages.nix
          ./modules/core/settings.nix
          ./modules/core/hyprland.nix
          ./modules/work/packages.nix
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };
    };
  };
}
