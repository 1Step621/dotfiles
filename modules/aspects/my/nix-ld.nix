{ den, ... }:
{
  my.nix-ld = {
    includes = [
      (den.batteries.unfree [ "steam-unwrapped" ])
    ];

    os = { pkgs, ... }: {
      programs.nix-ld = {
        enable = true;
        libraries = pkgs.steam-run.args.multiPkgs pkgs;
      };
    };
  };
}
