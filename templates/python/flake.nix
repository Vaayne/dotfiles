{
  description = "A flake for python dev env";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            python311
            python311Packages.pip
            ruff
            black
          ];
          shellHook = ''
            echo "Welcome to python env build by nix"
          '';
        };
      });
}
