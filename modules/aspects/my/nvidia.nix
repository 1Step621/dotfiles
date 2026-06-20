{ den, ... }:
{
  my.nvidia = {
    includes = [
      (den.batteries.unfree [
        "cuda_nvml_dev"
        "nvidia-x11"
        "nvidia-settings"
        "nvidia-kernel-modules"
      ])
    ];

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.nvtopPackages.nvidia
      ];
    };

    os = { config, ... }: {
      hardware = {
        graphics.enable = true;
        nvidia = {
          modesetting.enable = true;
          open = false;

          nvidiaSettings = true;
          package = config.boot.kernelPackages.nvidiaPackages.production;
        };
      };
      services.xserver.videoDrivers = [ "nvidia" ];
    };
  };
}
