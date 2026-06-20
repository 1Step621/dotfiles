{ my, ... }:
{
  my.gui-creative = {
    includes = [
      my.desktop
    ];

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.krita
        pkgs.inkscape
        pkgs.blender
        pkgs.onlyoffice-desktopeditors
      ];
    };
  };
}
