{ pkgs, ... }:

{
  services.mako = {
    enable = true;

    settings = {
      background-color = "#1e1e2ee6";
      text-color = "#cdd6f4";
      border-color = "#89b4fa";
      progress-color = "over #313244ff";

      font = "JetBrainsMono Nerd Font 10";
      width = 300;
      height = 100;
      margin = "10";
      padding = "15";
      border-size = 2;
      border-radius = 8;
      default-timeout = 3000;
    };
  };
}
