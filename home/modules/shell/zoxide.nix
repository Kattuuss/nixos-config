{ pkgs, ... }:

{
  # Zoxide (smart cd command)
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };
}
