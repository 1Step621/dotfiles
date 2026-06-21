{ my, ... }:
{
  my.fzf = {
    includes = [ my.shell ];

    homeManager = { pkgs, ... }: {
      programs.fzf.enable = true;

      programs.zsh = {
        plugins = [
          {
            name = "fzf-tab";
            src = pkgs.zsh-fzf-tab;
            file = "share/fzf-tab/fzf-tab.plugin.zsh";
          }
        ];
      };
    };
  };
}
