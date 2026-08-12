{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./neovim.nix
  ];

  home.packages = with pkgs; [
    vim # Minimal code editor
    yazi # Terminal file manager
    lazygit # Git TUI
    lazydocker # Docker TUI

    wl-clipboard # Clipboard utility to show its history
    cliphist # Stores clipboard history

    grim # Screenshot capture in Wayland
    slurp # Interactive area selector with mouse
    swappy # Fast graphical editor
  ];
}
