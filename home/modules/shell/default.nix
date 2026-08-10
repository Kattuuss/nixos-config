{ pkgs, ... }:

{
  imports = [
    ./fish.nix
    ./bash.nix
    ./zoxide.nix
    ./starship.nix
  ];

  # Packages used by the terminal
  home.packages = with pkgs; [
    eza                        # Modern icons
    nerd-fonts.jetbrains-mono  # Nerd Font for icons
  ];
}
