{ inputs, ... }:
{
  flake-file.inputs.llm-agents.url = "github:numtide/llm-agents.nix";

  my.codex = {
    os = { pkgs, ... }: {
      home.packages =
        let
          llm-agents-pkgs = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};
        in
        [
          llm-agents-pkgs.opencode2
          llm-agents-pkgs.codex
          llm-agents-pkgs.chatgpt
        ];
    };
  };
}
