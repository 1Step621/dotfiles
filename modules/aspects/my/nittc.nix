{
  my.nittc = {
    os = { options, ... }: {
      networking.timeServers = options.networking.timeServers.default ++ [
        "172.20.0.19"
      ];
    };
  };
}
