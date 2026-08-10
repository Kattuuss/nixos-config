{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Kattus";
    userEmail = "alexvalverdetorres2006@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "vim";
    };
  };
}
