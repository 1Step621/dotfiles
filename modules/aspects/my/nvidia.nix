{
  my.nvidia = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.nvtopPackages.nvidia
      ];
    };
    nixos = { config, ... }: {
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
