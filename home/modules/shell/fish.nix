{ pkgs, ... }:

{
  # Fish (main shell)
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting "" # Removes welcome msg
    '';
  };
}
