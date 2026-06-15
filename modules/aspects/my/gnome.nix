{
  my.gnome = {
    os = {
      desktopManager.gnome.enable = true;
    };
    homeManager = {
      programs.dconf.enable = true;
    };
  };
}
