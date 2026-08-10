{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Kattus";
        email = "alexvalverdetorres2006@gmail.com";
      };

      init.defaultBranch = "main";
      core.editor = "vim";
    };
  };
}
