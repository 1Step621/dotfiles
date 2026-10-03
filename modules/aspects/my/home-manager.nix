{
  my.home-manager = {
    homeManager = {
      programs.home-manager.enable = true;
    };
    os = {
      home-manager.backupFileExtension = "backup";
    };
  };
}
