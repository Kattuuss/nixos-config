{ pkgs, ... }:

let
  wall-random = pkgs.writeShellScriptBin "wall-random" (builtins.readFile ../../../scripts/swww/wall-random.sh);
  wall-select = pkgs.writeShellScriptBin "wall-select" (builtins.readFile ../../../scripts/swww/wall-select.sh);
in
{
  imports = [
    ./fish.nix
    ./bash.nix
    ./zoxide.nix
    ./starship.nix
  ];

  # Global aliases
  home.shellAliases = {
    # Nix related
    rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config";
    clean = "nix-collect-garbage -d";
    
    # General
    cd = "z";
    ls = "eza --icons=auto";
    ll = "eza -l --icons=auto";
    la = "eza -la --icons=auto";
    tree = "eza --tree --icons=auto"; 
  };

  # Packages shared by the terminals / CLIs
  home.packages = with pkgs; [
    # --- Scripts ---
    wall-random
    wall-select

    # --- Other pkgs ---
    eza        # Better 'ls' with icons
    bat        # Better 'cat' with syntax highlighting
    ripgrep    # Faster 'grep'
    fd         # Better 'find'
    btop       # System monitor
    fastfetch  # System information
    libnotify  # Send notifications
  ];
}
