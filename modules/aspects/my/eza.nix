{ my, ... }:
{
  my.eza = {
    includes = [ my.shell ];

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.eza
      ];
      programs.zsh.zsh-abbr.abbreviations = {
        ls = "eza";
        la = "eza -a";
        ll = "eza -l";
        lla = "eza -la";
      };
    };
  };
}
