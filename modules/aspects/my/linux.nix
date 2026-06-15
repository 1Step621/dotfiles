{
  my.linux.nixos = { pkgs, ... }: {
    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      tmp.useTmpfs = true;
      loader = {
        efi.canTouchEfiVariables = true;
        grub = {
          enable = true;
          device = "nodev";
          efiSupport = true;
          default = "saved";
          useOSProber = true;
          configurationLimit = 10;
        };
      };
      binfmt.emulatedSystems = [ "aarch64-linux" ];
    };
  };
}
