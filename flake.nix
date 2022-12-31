{
  description = "Home Manager configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvChad = {
      url = "github:NvChad/NvChad";
      flake = false;
    };
    dotfiles = {
      url = "github:Vaayne/dotfiles";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, home-manager, nvChad, dotfiles, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.weliu = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
          modules = [ ./home.nix ];
        extraSpecialArgs = {
          inherit nvChad;
          inherit dotfiles;
        };
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
