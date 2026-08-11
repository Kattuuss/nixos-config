{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system/locale.nix
    ./system/audio.nix
    ./system/nix.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network
  networking.hostName = "kattus-qemu"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Servers and Graphical Environments (System services)
  services.displayManager.gdm.enable = true; # Enable GNOME Display Manager
  
  services.xserver.enable = true; # Enable the X11 windowing system.
  # services.desktopManager.gnome.enable = true; # Enable GNOME
  programs.niri.enable = true; # Enable Niri

  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Environment variables for QEMU
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."kattus" = {
    isNormalUser = true;
    description = "kattus";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Essential system packages
  environment.systemPackages = with pkgs; [
    git
    curl	
  ];

  # System version
  system.stateVersion = "26.05";
}
