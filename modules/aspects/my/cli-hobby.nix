{
  my.cli-hobby = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.rsrpc
        pkgs.mprisence
      ];
    };
  };
}
