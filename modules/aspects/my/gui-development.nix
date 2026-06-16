{
  my.gui-development.homeManager = { pkgs, ... }: {
    home.packages = [
      pkgs.arduino-ide
      pkgs.stm32cubemx
      pkgs.kicad-small
    ];
  };
}
