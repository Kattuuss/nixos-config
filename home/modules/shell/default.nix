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
    ls = "eza --icons";
    ll = "eza -l --icons";
    la = "eza -la --icons";
    tree = "eza --tree --icons";
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
