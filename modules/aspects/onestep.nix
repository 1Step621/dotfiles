{ den, my, ... }:
{
  den.aspects.onestep = {
    includes = [
      (den.batteries.unfree [
        "zsh-abbr"
        "cuda_nvml_dev"
      ])
      den.batteries.primary-user

      my.system-basic
      my.password
      my.sound
      my.nvidia
      (my.windows "DAC833ABC83384B3")
      my.nittc
      my.cli-basic
      my.cli-development
      my.cli-hobby
      my.gdm
      my.niri
    ];
  };
}
