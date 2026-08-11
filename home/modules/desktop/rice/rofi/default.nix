{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    terminal = "{$pkgs.foot}/bin/foot"; # Launches the package selected on Rofi from the terminal
    extraConfig = {
      modi = "drun,run,filebrowser"; # Drun = apps | Run = commands | Filebrowser = files
      show-icons = true;
      icon-theme = "Papirus";
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "Search Apps";
      display-run = "Run command";

      # -- Not working for some reaason-
      # kb-element-next = ""; # Disconnects Tab key to go down on the list
      # kb-mode-next = "Tab"; # Tab switches to the next mode (drun -> run -> filebrowser)
      # kb-mode-previous = "ISO_Left_Tab"; # Shift + Tab goes backwards (filebrowser -> run -> drun)
    };
    theme = "purple";
  };

  home.packages = with pkgs; [
    papirus-icon-theme
  ];
}
