{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    procps # Needed for command "free"
  ];

  # Stores config.jsonc with NixOS logo
  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "logo": {
        "type": "builtin",
        "source": "nixos_small",
        "padding": {
          "top": 1,
          "left": 2,
          "right": 3
        }
      },
      "display": {
        "separator": "  ",
        "color": {
          "keys": "blue",
          "title": "cyan"
        }
      },
      "modules": [
        "break",
        {
         "type": "custom",
         "key": "╭───────────────────────────────────╮"
        },
        {
         "type": "kernel",
         "key": "│ \u001b[34m\u001b[0m  kernel",
         "format": "{release>22} │"
        },
        {
          "type": "command",
          "key": "│ \u001b[33m\u001b[0m  uptime",
          "text": "uptime -p | cut -d ' ' -f 2-",
          "format": "{>22} │"
        },
        {
         "type": "shell",
         "key": "│ \u001b[32m\u001b[0m  shell ",
         "format": "{pretty-name>22} │"
        },
        {
         "type": "command",
         "key": "│ \u001b[35m\u001b[0m  mem   ",
         "text": "free -m | awk 'NR==2{printf \"%.2f GiB / %.2f GiB\",$3/1024,$2/1024}'",
         "format": "{>22} │"
        },
        {
         "type": "packages",
         "key": "│ \u001b[36m\u001b[0m  pkgs  ",
         "format": "{all>22} │"
        },
        {
         "type": "command",
         "key": "│ \u001b[31m\u001b[0m  user  ",
         "text": "echo $USER",
         "format": "{>22} │"
        },
        {
         "type": "command",
         "key": "│ \u001b[34m\u001b[0m  hname ",
         "text": "hostnamectl hostname",
         "format": "{>22} │"
        },
        {
         "type": "os",
         "key": "│ \u001b[36m󰻀\u001b[0m  distro",
         "format": "{pretty-name>22} │"
        },
        {
         "type": "custom",
         "key": "╰───────────────────────────────────╯"
        },
        "break"
      ]
    }
  '';

  # Integration with Fish (Foot)
  programs.fish.interactiveShellInit = ''
    if status is-interactive
      fastfetch
    end
  '';

  # Integration on Bash (Kitty)
  programs.bash.initExtra = ''
    if [[ $- == *i* ]]; then
      fastfetch
    fi
  '';
}
