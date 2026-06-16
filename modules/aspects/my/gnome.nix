{
  my.gnome = {
    os = {
      services.desktopManager.gnome.enable = true;
      programs.dconf.enable = true;
    };
    homeManager = {
      dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };

        "org/gnome/shell/extensions/user-theme" = {
          name = "Colloid-Dark-Nord";
        };
      };

      xdg.mimeApps.defaultApplications = {
        "application/pdf" = "org.gnome.Papers.desktop";
        "audio/mpeg" = "org.gnome.Decibels";
        "audio/vnd.wave" = "org.gnome.Decibels";
        "audio/ogg" = "org.gnome.Decibels";
        "audio/flac" = "org.gnome.Decibels";
        "audio/aac" = "org.gnome.Decibels";
      };
    };
  };
}
