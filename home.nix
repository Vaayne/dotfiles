{ config, pkgs, nvChad, ... }:
let
  username = "weliu";
  homeDirectory = "/Users/weliu";
  stateVersion = "22.11";

in {

  nixpkgs = { config = { allowUnfree = true; }; };
  home = {
    username = "${username}";
    homeDirectory = "${homeDirectory}";
    stateVersion = "${stateVersion}";
    # install golbal packages
    packages = with pkgs; [
      nixfmt
      nixpkgs-fmt
      nodejs
      go
      tealdeer
      pre-commit
      yarn
      python311
      colima
      docker-client
      devbox
      rnix-lsp
      ripgrep
      spacevim
    ];
  };
  programs = {
    home-manager.enable = true;
    vscode = {
      enable = false;
      extensions = with pkgs.vscode-extensions; [
        dracula-theme.theme-dracula
        vscodevim.vim
        yzhang.markdown-all-in-one
      ];
    };
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      #extraConfig = builtins.readFile "${nvChad}/init.lua";
      #extraConfig = ''
      #  :luafile ${nvChad}/init.lua
      #'';
      plugins = with pkgs.vimPlugins; [ SpaceVim ];
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
      config = { global.load_dotenv = true; };
    };
    bat.enable = true;
    lazygit.enable = true;

    starship = {
      enable = false;
      enableZshIntegration = false;
    };

    git = {
      enable = true;
      userEmail = "liu.vaayne@gmail.com";
      userName = "liu.vaayne";
      ignores = [ ".idea" ".vacode" ".pyc" ];
      delta = {
        enable = true;
        options = { line-numbers = true; };
      };
      extraConfig = {
        core = {
          editor = "nvim";
          whitespace = "trailing-space,space-before-tab";
        };
      };
    };

    gitui = { enable = true; };

    go = { enable = true; };
    zoxide.enable = true;
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    navi = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      enable = true;

      # alias
      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
        k9s =
          "docker run --rm -it -v $KUBECONFIG:/root/.kube/config quay.io/derailed/k9s";
        hmb = "home-manager build --flake $HOME/.config/nixpkgs#$USER";
        hms =
          "nixfmt $HOME/.config/nixpkgs/home.nix && home-manager switch --flake $HOME/.config/nixpkgs#$USER";
      };
      history = { size = 10000; };
      # envs
      sessionVariables = {
        LC_ALL = "C";
        POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD = true;
        EDITOR = "nvim";
      };
      # plugins
      zplug = {
        enable = true;
        plugins = [
          { name = "zsh-users/zsh-autosuggestions"; }
          { name = "zsh-users/zsh-syntax-highlighting"; }
          { name = "zsh-users/zsh-completions"; }
          { name = "zsh-users/zsh-history-substring-search"; }
          {
            name = "plugins/zoxide";
            tags = [ "from:oh-my-zsh" ];
          }
          {
            name = "plugins/git";
            tags = [ "from:oh-my-zsh" ];
          }
          {
            name = "romkatv/powerlevel10k";
            tags = [ "as:theme" "depth:1" ];
          }
        ];
      };

    };
    nix-index = {
      enable = true;
      enableZshIntegration = true;
    };
  };

}
