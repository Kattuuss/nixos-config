{ config, pkgs, ... }:

{
  # Enables Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allows non free packages
  nixpkgs.config.allowUnfree = true;

  # Optimizes store automatically (removes duplications via hard links)
  nix.optimise.automatic = true;

  # Cleans older generations, keeping the last 5
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-generations +5";
  };
}
