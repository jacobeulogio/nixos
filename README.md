# My NixOS Configuration
<p align="center"><img src="https://i.imgur.com/X5zKxvp.png" width=150px></p
  This repository contains my personal NixOS configuration, managed using Nix [Flakes](https://nixos.wiki/wiki/Flakes). It's structured to be modular and easily adaptable
  across different machines.

  ### Repository Structure
---

  The configuration is organized into several key directories:


   - `/hosts`: Contains machine-specific configurations. Each subdirectory corresponds to a unique host and defines its hardware, filesystems, and which modules to import.
       - eulogio/: Configuration for my personal machine.
       - work/: Configurations for work-related machines (bth and thd).


   - `/modules`: Contains reusable sets of configurations (modules) that can be imported by any host. This is where the bulk of the system's logic resides.
       - core/: The base modules shared by all hosts.
           - hyprland.nix: Configures the Hyprland window manager and related tools.
           - packages.nix: Defines the core set of packages to be installed everywhere.
           - settings.nix: Includes common system settings like users, timezone, and locale.
       - work/: Modules specific to my work environment.
           - packages.nix: Installs additional packages needed for work.
           - postgres.nix: Configures a PostgreSQL database.
       - games.nix: A module for gaming-related packages and settings.
       - laptop_amd.nix: Contains hardware-specific tweaks for an AMD laptop.

   - `/shells`: Provides development environments.
       - python.nix: A development shell with common Python tools.


   - `flake.nix`: The entry point for the entire configuration. It defines the outputs of the flake, such as the NixOS configurations for each host and the development
     shells.

  How to Use

  Applying Changes to an Existing Machine

  To apply changes from this repository to an already installed system, navigate to the repository's root directory and run:

```nix

sudo nixos-rebuild switch --flake .#<hostname>

```


  For example, to apply the configuration for the eulogio host:


```nix

sudo nixos-rebuild switch --flake .#eulogio

```


  Using Development Shells

  To enter a development shell defined in the /shells directory, run:


```nix

nix develop .#<shell-name>

```


  For example, to use the Python shell:


```nix

nix develop .#python

```
