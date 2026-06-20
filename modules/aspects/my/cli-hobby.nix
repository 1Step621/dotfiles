{ my, ... }:
{
  my.cli-hobby = {
    includes = [
      my.shell
      my.rsrpc
    ];

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.mprisence
      ];
    };
  };
}
