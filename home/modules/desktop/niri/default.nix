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

    binds {
        Mod+T { spawn "foot"; }
        Mod+Q { close-window; }
        Mod+Alt+Space { toggle-window-floating; }
        Mod+F { maximize-column; }
        Mod+Shift+E { quit; }

        Mod+Left  { focus-column-left; }
        Mod+Right { focus-column-right; }
        Mod+H     { focus-column-left; }
        Mod+L     { focus-column-right; }
    }
  '';
}
