{ my, den, ... }:
{
  my.system-basic = {
    includes = [
      den.batteries.hostname
      den.batteries.define-user
      (den.batteries.user-shell "zsh")
      my.linux
      my.localization
      my.networking
      my.swap
      my.thermald
      my.nix
      my.nix-index
      my.nix-ld
      my.nh
      my.home-manager
      my.power-management
    ];
  };
}
