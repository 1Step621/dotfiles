{
  my.swap = {
    os = {
      boot.zswap = {
        enable = true;
        compressor = "zstd";
        maxPoolPercent = 25;
        shrinkerEnabled = true;
      };

      swapDevices = [
        {
          device = "/var/lib/swapfile";
          size = 16 * 1024;
        }
      ];
    };
  };
}
