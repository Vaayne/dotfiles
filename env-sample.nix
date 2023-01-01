{
  # for system please see: https://github.com/numtide/flake-utils/blob/master/default.nix#L14  
  system = "";
  username = "admin";
  homeDirectory = "/home/admin/";
  stateVersion = "22.11";
  git = {
    email = "git-email@gmail.com";
    user = "git-user";
  };
}
