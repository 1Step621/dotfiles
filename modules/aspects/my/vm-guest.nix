{
  my.vm-guest = {
    os = {
      virtualisation.vmVariant.virtualisation = {
        cores = 16;
        memorySize = 8192;
        diskSize = 102400;
        qemu.options = [
          "-snapshot"
        ];
      };
    };
  };
}
