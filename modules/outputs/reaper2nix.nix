{ inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      apps.reaper2nix = inputs.reaper-flake.apps.${pkgs.stdenv.hostPlatform.system}.reaper2nix;
    };
}
