{ pkgs, ... }:

{
  # Startship (customized prompt for the shells)
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;

    settings = {
      add_newline = false; # Removes initial blank line

      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[>](bold red)";
      };

      directory = {
        style = "bold cyan";
        truncation_length = 3;
      };

      git_branch = {
        symbol = " ";
        style = "bold purple";
      };
    };
  };
}
