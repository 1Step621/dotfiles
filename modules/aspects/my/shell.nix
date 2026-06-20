{ den, ... }:
{
  my.shell = {
    includes = [
      (den.batteries.unfree [ "zsh-abbr" ])
    ];

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
        programs.fzf.enable = true;

        programs.zoxide = {
          enable = true;
          enableZshIntegration = true;
          options = [ "--cmd cd" ];
        };

        home.file.".config/p10k/.p10k.zsh".source = ../../assets/.p10k.zsh;

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
            {
              name = "powerlevel10k";
              src = pkgs.zsh-powerlevel10k;
              file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
            }
          ];

          zsh-abbr = {
            enable = true;
            abbreviations = {
              cat = "bat";
              ls = "eza";
              la = "eza -a";
              ll = "eza -l";
              lla = "eza -la";
              rm = "rm -rf";
              cp = "cp -r";
              c = "clear";
              lg = "lazygit";
              rusti = "evcxr";
              drg = "ripdrag";
              open = "xdg-open";
              code = "zeditor";
              zed = "zeditor";
              y = "yazi";
              "ちぇん" = "cd";
              "チェン" = "cd";
            };
          };

          initContent = ''
            source "$HOME/.config/p10k/.p10k.zsh"

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
