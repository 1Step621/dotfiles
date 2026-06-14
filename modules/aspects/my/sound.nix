{
  my.pipewire.os = {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
    };
    security.rtkit.enable = true;
  };
}
