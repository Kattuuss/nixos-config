{ pkgs, ... }:

{
  # Foot (daily driver)
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "foot";
        font = "JetBrainsMono Nerd Font:size=11";
        pad = "12x12";
      };
      colors = {
        alpha = 0.9;
      };
    };
  };
}
