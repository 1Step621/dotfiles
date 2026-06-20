{ my, ... }:
{
  my.gnome = {
    includes = [
      my.desktop
    ];

    os = { pkgs, ... }: {
      services.desktopManager.gnome.enable = true;
      programs.dconf.enable = true;
      environment.gnome.excludePackages = [
        pkgs.baobab # disk usage analyzer
        pkgs.cheese # photo booth
        pkgs.epiphany # web browser
        pkgs.orca # screen reader
        pkgs.simple-scan # document scanner
        pkgs.yelp # help viewer
        pkgs.file-roller # archive manager
        pkgs.geary # email client
        pkgs.seahorse # password manager

        pkgs.gnome-calculator
        pkgs.gnome-calendar
        pkgs.gnome-characters
        pkgs.gnome-clocks
        pkgs.gnome-contacts
        pkgs.gnome-logs
        pkgs.gnome-maps
        pkgs.gnome-music
        pkgs.gnome-photos
        pkgs.gnome-weather
      ];
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

      home.sessionVariables.GSK_RENDERER = "gl";
    };
  };
}
