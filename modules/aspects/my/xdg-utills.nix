{ my, ... }: {
  my.xdg-utils = {
    includes = [ my.desktop ];

    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.xdg-utils ];

      programs.zsh.zsh-abbr.abbreviations = {
        open = "xdg-open";
      };
    };
  };
}
