{
  description = "A flake for python";
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
            python310
            (python310.withPackages (ps: with ps; [ pip black ruff ]))
          ];
          shellHook = ''
            echo "Welcome to python env build by nix"
          '';
        };
      });
}
