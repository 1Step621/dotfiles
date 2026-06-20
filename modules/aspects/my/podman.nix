{ my, ... }:
{
  my.podman = {
    includes = [ my.shell ];

    os = {
      virtualisation.podman = {
        enable = true;
        dockerCompat = true;
      };
    };
  };
}
