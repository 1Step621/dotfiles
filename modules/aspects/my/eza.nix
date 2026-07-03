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
        lt = "eza --tree";
        lt2 = "eza --tree --level=2";
        lt3 = "eza --tree --level=3";
        lt4 = "eza --tree --level=4";
        lt5 = "eza --tree --level=5";
      };
    };
  };
}
