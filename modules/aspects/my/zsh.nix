{
  my.zsh = {
    os = {
      environment.shellAliases = {
        ls = null;
        ll = null;
        l = null;
      };
    };
    homeManager =
      { pkgs, ... }:
      {
        programs.zsh = {
          enable = true;

          autocd = true;
          autosuggestion.enable = true;
          enableCompletion = true;
          syntaxHighlighting.enable = true;

          plugins = [
            {
              name = "fzf-tab";
              src = pkgs.zsh-fzf-tab;
              file = "share/fzf-tab/fzf-tab.plugin.zsh";
            }
          ];
          initContent = ''
            export _ZO_EXCLUDE_DIRS="$HOME:/nix/store/*:$HOME/.*"

            zoxide_zi_insert() {
              local dir
              dir="$(zoxide query -i)" || return
              zle -U "$dir"
              zle reset-prompt
            }
            zle -N zoxide_zi_insert
            bindkey '^G' zoxide_zi_insert

            ABBR_REGULAR_ABBREVIATION_GLOB_PREFIXES+=(
              '*& '
              '*&& '
              '*\| '
              '*\|\| '
              '*; '
            )

            setopt interactivecomments

            alias \$=""
          '';
        };
      };
  };
}
