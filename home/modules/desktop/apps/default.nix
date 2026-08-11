{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
  ];

  home.packages = with pkgs; [
    #  bruno           # API client
    vscode          # Code editor
    #  jetbrains.idea  # Code editor (Java specialized)
  ];
}
