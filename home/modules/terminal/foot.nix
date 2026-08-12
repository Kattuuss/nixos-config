{ pkgs, ... }:

{
  # Ensures fastfetch is installed
  home.packages = with pkgs; [
    fastfetch
  ];

  # Foot (daily driver)
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "${pkgs.fish}/bin/fish";
        title = "foot";
        font = "JetBrainsMono Nerd Font:size=12";
        letter-spacing = "0";
        dpi-aware = "no";
        pad = "25x25";
        bold-text-in-bright = "no";
      };

      scrollback = {
        lines = 10000;
      };

      cursor = {
        style = "beam";
        beam-thickness = "1.5";
      };

      colors-dark = {
        alpha = 0.9;
      };

      key-bindings = {
        scrollback-up-page = "Page_Up";
        scrollback-down-page = "Page_Down";
        search-start = "Control+Shift+f";
      };

      search-bindings = {
        cancel = "Escape";
        find-prev = "Shift+F3";
        find-next = "F3 Control+g";
      };
    };
  };
}
