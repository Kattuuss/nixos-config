{ pkgs, ... }:

{
  # Bash (scripting and global compatibility)
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config";
    };
  };
}
