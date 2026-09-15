{ den, ... }:
{
  my.steam-run = {
    includes = [
      (den.batteries.unfree [ "steam-unwrapped" ])
    ];

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.steam-run
      ];
    };
  };
}
