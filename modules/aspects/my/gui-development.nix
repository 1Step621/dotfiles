{
  den,
  my,
  inputs,
  ...
}:
{
  flake-file.inputs.llm-agents.url = "github:numtide/llm-agents.nix";

  my.gui-development = {
    includes = [
      (den.batteries.unfree [ "stm32cubemx" ])
      my.desktop
    ];

    homeManager = { pkgs, ... }: {
      home.packages =
        let
          llm-agents-pkgs = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};
        in
        [
          pkgs.arduino-ide
          pkgs.stm32cubemx
          pkgs.kicad-small
          llm-agents-pkgs.chatgpt
        ];
      home.sessionVariables.RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
    };

    os = { pkgs, ... }: {
      services.udev.packages = [
        pkgs.platformio-core.udev
      ];
    };
  };
}
