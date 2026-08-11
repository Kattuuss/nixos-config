{ pkgs, ... }:

{
  # Kitty (used when kitty protocol or gpu acceleration)
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrainsMono Nerd Font:size=11";
      font_size = "11.0";
      disable_ligatures = "always"; # I do not like these
      background_opacity = "0.9";
      enable_audio_bell = false;
    };
  }; 
}
