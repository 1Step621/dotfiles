{
  my.gui-development = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.arduino-ide
        pkgs.stm32cubemx
        pkgs.kicad-small
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
