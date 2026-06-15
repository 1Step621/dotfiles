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
    ];
  };
}
