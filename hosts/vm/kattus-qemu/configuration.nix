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

  # Enables OpenSSH
  services.openssh.enable = true;

  # Servers and Graphical Environments (System services)
  services.displayManager.gdm.enable = true; # Enable GNOME Display Manager
  services.displayManager.defaultSession = "hyprland";

  services.xserver.enable = false; # Enable the X11 windowing system.
  # services.desktopManager.gnome.enable = true;        # Enable GNOME
  programs.niri.enable = true; # Enable Niri
  programs.hyprland = {
    enable = true; # Enable Hyprland
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
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [

    ];
  };

  # Essential system packages
  environment.systemPackages = with pkgs; [
    git
    curl
  ];

  # Allows Mason (Neovim) to download pkgs dynamiclly
  # programs.nix-ld.enable = true;

  # System version
  system.stateVersion = "26.05";
}
