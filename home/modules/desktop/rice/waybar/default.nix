{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = [{
      layer = "top";
      position = "top";
      height = 30;
      spacing = 4;

      modules-left = [ "hyprland/workspaces" "hyprland/window" ];
      modules-center = [ "clock" ];
      modules-right = [ "pulseaudio" "cpu" "memory" "tray" ];

      "hyprland/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        format = "{name}";
      };

      "clock" = {
        format = "{:%H:%M %d%m%Y}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };

      "cpu" = {
        format = "CPU {usage}%";
        interval = 2;
      };

      "memory" = {
        format = "RAM {}%";
      };

      "pulseaudio" = {
        format = "VOL {volume}%";
        format-muted = "MUTED";
        on-click = "pavucontrol";
      };
    }];

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background-color: #1e1e2e;
        color: #cdd6f4;
      }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: #cdd6f4;
      }

      #workspaces button.active {
        background-color: #89b4fa;
        color: #11111b;
      }

      #clock, #cpu, #memory, #pulseaudio, #tray {
        padding: 0 10px;
        margin: 0 2px;
      }

      #clock {
        color: #f9e2af;
      }
    '';
  };
}
