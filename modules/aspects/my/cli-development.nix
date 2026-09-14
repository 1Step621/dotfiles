{ my, inputs, ... }:
{
  flake-file.inputs.llm-agents.url = "github:numtide/llm-agents.nix";

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
      home.packages =
        let
          llm-agents-pkgs = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};
        in
        [
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
          llm-agents-pkgs.opencode2
          llm-agents-pkgs.codex
        ];
    };
  };
}
