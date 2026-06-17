{
  my.podman.nixos = {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };
  };
}
