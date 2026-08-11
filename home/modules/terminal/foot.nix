{ pkgs, ... }:

{
  # Foot (daily driver)
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "foot";
        font = "JetBrainsMono Nerd Font:size=12";
        pad = "12x12";
      };
      colors-dark = {
        alpha = 0.9;
      };
    };
  };
}
