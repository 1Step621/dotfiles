{
  my.cli-hobby = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.rsrpc
        pkgs.mprisence
      ];

      # https://github.com/SpikeHD/rsRPC/pull/28
      home.file.".config/rsrpc/detectables.json".text = ''
        []
      '';
    };
  };
}
