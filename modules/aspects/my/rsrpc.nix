{ my, ... }:
{
  my.rsrpc = {
    includes = [
      my.desktop
    ];

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.rsrpc
      ];

      programs.niri.settings.spawn-at-startup = [
        {
          command = [
            "rsrpc-cli"
            "--no-process-scan"
          ];
        }
      ];
    };
  };
}
