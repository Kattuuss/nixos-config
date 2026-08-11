{ pkgs, ... }:

{
  imports = [
    ./rofi
    ./waybar
    ./mako
  ];

  home.packages = with pkgs; [
    awww
  ];
}
