{ pkgs, ... }:

{
  # KDL file that follows Niri
  xdg.configFile."niri/config.kdl".text = ''
    input {
        keyboard {
            xkb {
                layout "es"
            }
        }
    }

    // Executes at the start
    spawn-at-startup "awww-daemon"
    spawn-at-startup "mako"
    spawn-at-startup "waybar"
    spawn-at-startup "sh" "-c" "wl-paste --type text --watch cliphist store"
    spawn-at-startup "sh" "-c" "wl-paste --type image --watch cliphist store"

    binds {
      // Open foot terminal
      Mod+T { spawn "foot"; }

      // Open app launcher (Rofi)
      Mod+Space { spawn "rofi" "-show" "drun"; }
      Mod+Shift+Space { spawn "rofi" "-show" "run"; }

      // Open browser
      Mod+W { spawn "firefox"; }

      // Window options
      Mod+Q { close-window; }
      Mod+Alt+Space { toggle-window-floating; }
      Mod+F { maximize-column; }
      Mod+Shift+E { quit; }

      // Move focus
      Mod+Left  { focus-column-left; }
      Mod+Right { focus-column-right; }
      Mod+H     { focus-column-left; }
      Mod+L     { focus-column-right; }

      // Move workspace windows
      Mod+Shift+Right { move-column-right; }
      Mod+Shift+Left  { move-column-left; }
      Mod+Shift+H     { move-column-left; }
      Mod+Shift+L     { move-column-right; }

      // Clipboard + Emoji/Icon selector
      Mod+V { spawn "sh" "-c" "cliphist list | rofi -dmenu -p Clipboard | cliphist decode | wl-copy"; }
      Mod+Period { spawn "rofimoji"; }

      // Screenshot capture
      Mod+Shift+S { spawn "sh" "-c" "grim -g \"$(slurp)\" - | swappy -f -"; }
      Print { spawn "sh" "-c" "grim -g \"$(slurp)\" - | swappy -f -"; }
      Ctrl+Print { spawn "sh" "-c" "grim - | wl-copy"; }
    }
  '';
}
