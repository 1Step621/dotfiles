{ my, den, ... }:
{
  my.system = {
    includes = [
      den.batteries.hostname
      den.batteries.define-user
      (den.batteries.user-shell "zsh")
      my.vm
      my.linux
      my.localization
      my.networking
      my.swap
      my.nix
      my.nix-index
      my.nix-ld
      my.nh
      my.home-manager
    ];

    os = {
      services.thermald.enable = true;
      powerManagement.cpuFreqGovernor = "ondemand";
    };
  };
}
