{ config, pkgs, ... }:

{
  # Disables PulseAudio to avoid conflicts with PipeWire
  services.pulseaudio.enable = false;

  # Allows real time for PipeWire
  security.rtkit.enable = true;

  # Enable sound with PipeWire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
