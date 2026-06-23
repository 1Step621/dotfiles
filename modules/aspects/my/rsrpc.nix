{ my, ... }:
{
  my.rsrpc = {
    includes = [
      my.shell
      my.desktop
    ];

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.rsrpc
      ];

      # https://github.com/SpikeHD/rsRPC/pull/28
      home.file.".config/rsrpc/detectables.json".text = ''
        []
      '';

      programs.niri.settings.spawn-at-startup = [
        {
          command = [
            "rsrpc-cli"
            "--detectable-file"
            ".config/rsrpc/detectables.json"
          ];
        }
        { command = [ "mprisence" ]; }
      ];
    };
  };
}
