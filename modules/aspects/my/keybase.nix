{
  my.keybase = {
    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.keybase ];
    };
    os.services.keybase.enable = true;
  };
}
