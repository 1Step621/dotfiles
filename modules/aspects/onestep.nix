{ den, my, ... }:
{
  den.aspects.onestep = {
    includes = [
      (den.batteries.unfree [
        "zsh-abbr"
        "cuda_nvml_dev"
        "nvidia-x11"
        "nvidia-settings"
      ])

      my.password
      my.system-basic
      den.batteries.primary-user
      my.desktop
      my.nvidia
      (my.windows "DAC833ABC83384B3")
      my.nittc
      my.cli-basic
      my.cli-development
      my.cli-hobby
      my.gui-basic
    ];
  };
}
