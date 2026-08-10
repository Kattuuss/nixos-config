{ pkgs, ...}:

{
  home.username = "kattus";
  home.homeDirectory = "/home/kattus";

  # Imports modules
  imports = [
    ./modules/tools/git.nix
  ];

  # User packages
  home.packages = with pkgs; [
    fastfetch
    btop
    vim
  ];

  # Programs special configurations
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config";
    };
  };

  # Enables home manager
  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
