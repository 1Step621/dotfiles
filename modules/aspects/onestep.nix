{ den, my, ... }:
{
  den.aspects.onestep = {
    includes = [
      (den.batteries.unfree [
        "zsh-abbr"
        "cuda_nvml_dev"
        "nvidia-x11"
        "nvidia-settings"
        "nvidia-kernel-modules"
        "stm32cubemx"
      ])

      my.password
      my.system-basic
      den.batteries.primary-user
      my.desktop
      my.nvidia
      my.nittc
      my.cli-basic
      my.cli-development
      my.cli-hobby
      my.gui-basic
      my.gui-creative
      my.gui-hobby
      my.gui-development
      (my.windows "DAC833ABC83384B3")
      (my.hotspot-switch {
        ethernet-if = "enp100s0f3u3";
        wifi-if = "wlp2s0";
        hotspot-name = "lanstep";
      })

      {
        homeManager.programs.git.settings.user = {
          name = "1Step621";
          email = "onestep621@gmail.com";
        };
      }
    ];
  };
}
