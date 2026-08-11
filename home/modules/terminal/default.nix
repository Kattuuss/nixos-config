{ pkgs, ... }:

{
  imports = [
    ./foot.nix
    ./kitty.nix
  ];

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono  # JetBrains Nerd Mono font
  ];
}
