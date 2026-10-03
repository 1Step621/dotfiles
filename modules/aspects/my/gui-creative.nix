{ my, ... }:
{
  my.gui-creative = {
    includes = [
      my.desktop
      my.reaper
      my.openutau
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
