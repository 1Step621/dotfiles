{
  my.gtk-theme.homeManager = { pkgs, ... }: {
    gtk = {
      enable = true;
      iconTheme = {
        name = "Colloid-Nord-Dark";
        package = pkgs.colloid-icon-theme.override {
          schemeVariants = [ "nord" ];
        };
      };

      theme = {
        name = "Colloid-Dark-Nord";
        package = pkgs.colloid-gtk-theme.override {
          tweaks = [
            "nord"
            "normal"
          ];
        };
      };

      gtk4.theme = {
        name = "Colloid-Dark-Nord";
        package = pkgs.colloid-gtk-theme.override {
          tweaks = [
            "nord"
            "normal"
          ];
        };
      };

      cursorTheme = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
      };

      font = {
        name = "Noto Sans CJK JP";
        package = pkgs.noto-fonts-cjk-sans;
      };
    };
  };
}
