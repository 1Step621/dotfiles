{ den, ... }:
{
  my.nix-ld = {
    includes = [
      (den.batteries.unfree [ "steam-unwrapped" ])
    ];

    os = { pkgs, ... }: {
      programs.nix-ld = {
        enable = true;
        libraries = pkgs.appimageTools.defaultFhsEnvArgs.multiPkgs pkgs;
      };
    };
  };
}
