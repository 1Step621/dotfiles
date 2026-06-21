{ my, ... }:
{
  my.cli-development = {
    includes = [
      my.shell
      my.vcs
      my.direnv
      my.keybase
      my.podman
      my.evcxr
    ];

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.opencode
        pkgs.mergiraf
        pkgs.any-nix-shell
        pkgs.nixd
        pkgs.nil
        pkgs.gh
        pkgs.uv
        pkgs.python3
        pkgs.nodejs
        pkgs.typst
        pkgs.delta
        pkgs.mold-unwrapped
        pkgs.clang-tools
      ];
    };
  };
}
