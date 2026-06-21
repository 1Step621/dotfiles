{ den, my, ... }:
{
  my.zsh-abbr = {
    includes = [
      my.shell
      (den.batteries.unfree [ "zsh-abbr" ])
    ];

    homeManager = {
      programs.zsh = {
        zsh-abbr = {
          enable = true;
          abbreviations = {
            rm = "rm -rf";
            cp = "cp -r";
            c = "clear";
            "ちぇん" = "cd";
            "チェン" = "cd";
          };
        };
        initContent = ''
          export ABBR_SET_LINE_CURSOR=1
          ABBR_REGULAR_ABBREVIATION_GLOB_PREFIXES+=(
            '*& '
            '*&& '
            '*\| '
            '*\|\| '
            '*; '
          )
        '';
      };
    };
  };
}
