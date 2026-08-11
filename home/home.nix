{ pkgs, ...}:

{
  home.username = "kattus";
  home.homeDirectory = "/home/kattus";

  # Imports modules
  imports = [
    ./modules/tools
    ./modules/terminal
    ./modules/shell
    ./modules/desktop
  ];

  # User packages
  home.packages = with pkgs; [
  #  yazi
  ];

  # Enables home manager
  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
