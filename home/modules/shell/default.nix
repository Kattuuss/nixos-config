{ pkgs, ... }:

{
  imports = [
    ./fish.nix
    ./bash.nix
    ./zoxide.nix
    ./starship.nix
  ];

  # Global aliases
  home.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config";
    clean = "nix-collect-garbage -d";
    ls = "eza --icons=auto";
    ll = "eza -l --icons=auto";
    la = "eza -la --icons=auto";
    tree = "eza --tree --icons=auto";
  };

  # Packages shared by the terminals / CLIs
  home.packages = with pkgs; [
    eza        # Better 'ls' with icons
    bat        # Better 'cat' with syntax highlighting
    ripgrep    # Faster 'grep'
    fd         # Better 'find'
    btop       # System monitor
    fastfetch  # System information
  ];
}
