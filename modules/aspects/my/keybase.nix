{ my, ... }:
{
  my.keybase = {
    includes = [ my.shell ];

    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.keybase ];
    };

    os.services.keybase.enable = true;
  };
}
