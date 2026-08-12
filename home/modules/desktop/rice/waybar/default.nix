{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    # systemd.enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        height = 36;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "network"
          "battery"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;

          # Show the same 5 workspaces
          persistent-workspaces = {
            "*" = [
              1
              2
              3
              4
              5
            ];
          };

          # Hides the default number
          format = "";
        };

        "clock" = {
          format = "{:%H:%M | %d-%m-%Y}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "network" = {
          format-wifi = "Battery: {essid}";
          fomat-ethernet = "Ethernet: {ipaddr}";
          format-disconnected = "Offline";
          tooltip-format = "{ifname} via {gwaddr}";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}";
          format-charging = "Charging: {capacity}%";
          format-plugged = "Plugged: {capacity}%";
          format-icons = [ ];
        };
      }
    ];

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font", "Font Awesome 6 Free", sans-serif;
        font-size: 13px;
        min-height: 0;
      }

      /* Transparent base bar */
      window#waybar {
        background-color: transparent;
        color: #cdd6f4;
      }

      /* Left workspaces with circles */
      #workspaces {
        background-color: #1e1e2e;
        margin: 5px 0 0 10px;
        padding: 0 8px;
        border-radius: 12px;
      }

      #workspaces button {
        padding: 0;
        margin: 6px 4px;
        min-width: 30px;
        height: 10px;
        border-radius: 50%;
        background-color: #45475a;
        transition: all 0.2s ease-in-out;
      }

      #workspaces button.active {
        background-color: #89b4fa;
        min-width: 20px;
        border-radius: 5px; /* Se alarga un poco al estar activo */
      }

      #workspaces button.urgent {
        background-color: #f38ba8;
      }

      /* Central notch */
      #clock {
        background-color: #1e1e2e;
        color: #cdd6f4;
        padding: 0 20px;
        margin-top: 0;
        border-radius: 0 0 12px 12px; /* Redondeado solo abajo para simular el notch */
        font-weight: bold;
      }

      /* Right modules */
      #network, #battery {
        background-color: #1e1e2e;
        padding: 0 14px;
        margin: 5px 0 0 0;
      }

      #network {
        border-radius: 12px 0 0 12px;
        color: #89b4fa;
      }

      #battery {
        border-radius: 0 12px 12px 0;
        margin-right: 10px;
        color: #a6e3a1;
      }

      #battery.warning {
        color: #f9e2af;
      }

      #battery.critical {
        color: #f38ba8;
      }
    '';
  };
}
