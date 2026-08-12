{ pkgs, ... }:

{
  imports = [
    ./rofi
    ./waybar
    ./mako
  ];

  # Forces system to index fonts declared in home.packages
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono # JetBrains Nerd Mono font (main font)
    font-awesome # Font Awesome font (mainly for icons/emojis)
    awww
  ];
}
