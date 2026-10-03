{ den, my, ... }:
{
  my.steam-run = {
    includes = [
      (den.batteries.unfree [ "steam-unwrapped" ])
      my.desktop
    ];

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.steam-run
      ];
    };
  };
}
