{ my, ... }:
{
  my.evcxr = {
    include = [ my.shell ];

    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.evcxr ];
      programs.zsh.zsh-abbr.abbreviations = {
        rusti = "evcxr";
      };
    };
  };
}
