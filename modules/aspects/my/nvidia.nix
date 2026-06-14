{
  my.nvidia.homeManager = { pkgs, ... }: {
    home.packages = [
      pkgs.nvtopPackages.nvidia
    ];
  };
}
