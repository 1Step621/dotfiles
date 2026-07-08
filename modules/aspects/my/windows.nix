{
  my.windows = partition-id: { lib, ... }: {
    os = {
      boot = {
        supportedFilesystems.ntfs = lib.mkForce false;
        kernelModules = [ "ntfs" ];
        loader.limine.extraEntries = ''
          /Windows
              protocol: efi
              path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
        '';
      };
      fileSystems."/mnt/windows" = {
        device = "/dev/disk/by-uuid/${partition-id}";
        fsType = "ntfs";
        options = [
          "rw"
          "uid=1000"
          "gid=100"
          "umask=022"
        ];
      };
    };
  };
}
