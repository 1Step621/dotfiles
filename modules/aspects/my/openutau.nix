{ my, ... }:
{
  my.openutau = {
    includes = [ my.desktop ];

    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.openutau ];
    };
  };
}
