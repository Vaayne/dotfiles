{ config, pkgs, nvChad, dotfiles, ... }:
let env = import ./env.nix;

in {
  nixpkgs = { config = { allowUnfree = true; }; };
  home = {
    username = env.username;
    homeDirectory = env.homeDirectory;
    stateVersion = env.stateVersion;

    file = {
      ".config/nvim/init.lua".source = "${nvChad}/init.lua";
      ".config/nvim/lua/core".source = "${nvChad}/lua/core";
      ".config/nvim/lua/plugins".source = "${nvChad}/lua/plugins";
      ".config/nvim/lua/custom".source = "${dotfiles}/configs/nvim/";
    };

    # install golbal packages
    packages = with pkgs; [
      tmux
      tailscale

      nixfmt
      nixpkgs-fmt
      nodejs
      yarn
      nodePackages.pnpm
      go
      tealdeer
      # python
      pre-commit
      python311
      python311Packages.pip
      # docker
      docker-client
      docker-compose
      devbox
      rnix-lsp
      ripgrep
      fzf
      fd
      rustc
      cargo
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
      plugins = with pkgs.vimPlugins; [ vim-nix null-ls-nvim ];
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
      enableZshIntegration = true;
    };

    git = {
      enable = true;
      userEmail = env.git.email;
      userName = env.git.user;
      ignores = [
        ".idea"
        ".vscode"
        ".pyc"
        ".venv"
        ".ruff_cache"
        ".direnv"
        "node_modules"
      ];
      delta = {
        enable = true;
        options = { line-numbers = true; };
      };
      extraConfig = {
        core = {
          editor = "nvim";
          whitespace = "trailing-space,space-before-tab";
        };
        init = { defaultBranch = "main"; };
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
        hmb =
          "cd $HOME/.config/nixpkgs && git add -f env.nix && home-manager build --flake .#$USER && git restore --stage env.nix && cd -";
        hms =
          "cd $HOME/.config/nixpkgs && git add -f env.nix && home-manager switch --flake .#$USER && git restore --stage env.nix && cd -";
        # use sed -i "" 's/python311/python310/g' flake.nix to replace python3.11 with python3.10 
        dev-py =
          "nix flake init --template github:Vaayne/dotfiles#python --refresh";
      };
      history = { size = 10000; };
      # envs
      sessionVariables = {
        LC_ALL = "C";
        POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD = true;
        EDITOR = "nvim";
      };
      initExtra = if env.system == "aarch64-darwin" then ''
        eval "$(/opt/homebrew/bin/brew shellenv)"
      '' else
        "";
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
      enable = false;
      enableZshIntegration = true;
    };
  };

}
