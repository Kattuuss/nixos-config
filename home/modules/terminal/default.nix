{ pkgs, ... }:

{
  imports = [
    ./foot.nix
    ./kitty.nix
    ./fastfetch.nix
  ];
}
