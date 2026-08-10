{ pkgs, ... }:

{
  # Fish (main shell)
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting "" # Removes welcome msg
    '';
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config";
      ls = "eza --icons";
      ll = "eza -l --icons";
    };
  };
}
