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
    };
   theme = "purple";
  };

  home.packages = with pkgs; [
    papirus-icon-theme
  ];
}
