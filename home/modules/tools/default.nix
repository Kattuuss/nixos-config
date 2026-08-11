{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./neovim.nix
  ];

  home.packages = with pkgs; [
    vim         # Minimal code editor
    yazi        # Terminal file manager
    lazygit     # Git TUI
    lazydocker  # Docker TUI
  ];
}
