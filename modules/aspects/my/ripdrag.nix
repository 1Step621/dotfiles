{ my, ... }:
{
  my.ripdrag = {
    includes = [ my.desktop ];

    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.ripdrag ];

      programs.zsh.zsh-abbr.abbreviations = {
        drg = "ripdrag";
      };
    };
  };
}
