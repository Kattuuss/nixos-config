{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      # Default monitor
      monitor = [
        ",preferred,auto,1"
      ];

      # Essential environment variables for Wayland
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE_24"
      ];

      # Borders and gaps
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active.border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive.border" = "rgba(595959aa)";
        layout = "dwindle";
      };

      # Roundness and transparency
      decoration = {
        rounding = 0;
        active_opacity = 0.95;
        inactive_opacity = 0.85;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
      };

      # Spanish keyboard
      input = {
        kb_layout = "es";
        follow_mouse = 1;
      };

      # Super key
      "$mainMod" = "SUPER";

      # Shortcuts (binds)
      bind = [
        # Open foot terminal
        "$mainMod, Return, exec, foot";

        # Windows options
        "$mainMod, Q, kilactive,";
        "$mainMod, SHIFT, E, exit";
        "$mainMod, V, togglefloating,";
        "$mainMod, F, fullscreen,";

        # Move focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        # Go to workspace
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"

        # Move to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
      ];
    };
  };
}
