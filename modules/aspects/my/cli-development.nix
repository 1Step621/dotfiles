{ my, ... }:
{
  my.cli-development = {
    includes = [
      my.git
      my.direnv
      my.keybase
      my.podman
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
        pkgs.lazygit
        pkgs.typst
        pkgs.delta
        pkgs.mold-unwrapped
        pkgs.evcxr
        pkgs.clang-tools
      ];
    };
  };
}
