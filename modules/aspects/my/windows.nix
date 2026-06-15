{
  my.windows = partition-id: {
    os = {
      time.hardwareClockInLocalTime = true;
      fileSystems."/mnt/windows" = {
        device = "/dev/disk/by-uuid/${partition-id}";
        fsType = "ntfs3";
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
