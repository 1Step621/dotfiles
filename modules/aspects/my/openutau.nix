{
  my.openutau = {
    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.openutau ];
    };
  };
}
