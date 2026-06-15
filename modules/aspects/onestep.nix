{ den, my, ... }:
{
  den.aspects.onestep = {
    includes = [
      (den.batteries.unfree [ "zsh-abbr" ])
      den.batteries.primary-user

      my.system-basic
      my.password
      my.sound
      my.nvidia
      my.dual-boot
      my.nittc
      my.cli-basic
      my.cli-development
      my.cli-hobby
      my.gdm
      my.niri
    ];
  };
}
