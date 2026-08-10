{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    configType = "hyprlang"; # Until "$mod" bug is fixed, stick to hyprland instead of lua

    settings = {
      # Default monitor
      monitor = [
        ",preferred,auto,1"
      ];

      # Essential environment variables for Wayland
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      # Borders and gaps
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };

      # Roundness and transparency
      decoration = {
        rounding = 0;
        active_opacity = 0.95;
        inactive_opacity = 0.95;

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

      # Shortcuts (binds)
      "$mod" = "SUPER";

      bind = [
        # Open foot terminal
        "$mod, T, exec, foot"

        # Windows options
        "$mod, Q, killactive"
        "$mod SHIFT, E, exit"
        "$mod ALT, SPACE, togglefloating"
        "$mod, F, fullscreen"

        # Move focus
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        # Go to workspace
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"

        # Move to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
      ];
    };
  };
}
