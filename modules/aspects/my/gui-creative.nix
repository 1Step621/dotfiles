{
  my.gui-creative.homeManager = { pkgs, ... }: {
    home.packages = [
      pkgs.krita
      pkgs.inkscape
      pkgs.blender
      pkgs.onlyoffice-desktopeditors
    ];
  };
}
