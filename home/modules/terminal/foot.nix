{ pkgs, ... }:

{
  # Foot (daily driver)
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "foot";
        shell = "${pkgs.fish}/bin/fish";
        font = "JetBrainsMono Nerd Font:size=11";
        pad = "12x12";
      };
      colors-dark = {
        alpha = 0.9;
      };
    };
  };
}
