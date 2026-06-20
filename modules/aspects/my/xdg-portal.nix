{
  my.xdg-portal = {
    os = { pkgs, ... }: {
      xdg.portal = {
        enable = true;
        xdgOpenUsePortal = true;
        config.common.default = "gnome";
        extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
      };
    };
  };
}
