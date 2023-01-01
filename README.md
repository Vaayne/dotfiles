# dotfiles

My dotfiles

# Usage

1. Install nix: https://nixos.org/download.html
2. `git clone https://github.com/Vaayne/dotfiles ~/.config/nixpkgs`
3. `cp env-sample.env env.nix`
4. follow home manager manual: https://rycee.gitlab.io/home-manager/index.html#ch-nix-flakes
5. `echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf`
6. `cd ~/.config/nixpkgs`
7. `nix build --no-link .#homeConfigurations.{your username in env.nix}.activationPackage`
8. `"$(nix path-info .#homeConfigurations.{your username in env.nix}.activationPackage)"/activate`
9. `nix flake update`
10. `home-manager switch --flake '.#{your username in env.nix}'`
11. there you go
