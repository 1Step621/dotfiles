{
  my.windows = partitionId: {
    os = {
      time.hardwareClockInLocalTime = true;
      fileSystems."/mnt/windows" = {
        device = "/dev/disk/by-uuid/${partitionId}";
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
