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
          venvDir = "./.venv";
          buildInputs = with pkgs; [
            python311
            python311Packages.venvShellHook
            ruff
            black
          ];
          postVenvCreation = ''
            unset SOURCE_DATE_EPOCH
            if [ -d requirements.txt ]; then
              pip install -r requirements.txt
            fi
          '';
          postShellHook = ''
            echo "Welcome to python env build by nix"
          '';
        };
      });
}
