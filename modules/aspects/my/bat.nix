{ my, ... }:
{
  my.bat = {
    includes = [ my.shell ];

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.bat
      ];
      programs.zsh.zsh-abbr.abbreviations = {
        cat = "bat";
      };
    };
  };
}
