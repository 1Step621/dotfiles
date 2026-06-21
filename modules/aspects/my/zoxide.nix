{ my, ... }:
{
  my.zoxide = {
    includes = [ my.shell ];

    homeManager = {
      programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
        options = [ "--cmd cd" ];
      };

      programs.zsh.initContent = ''
        export _ZO_EXCLUDE_DIRS="$HOME:/nix/store/*:$HOME/.*"

        zoxide_zi_insert() {
          local dir
          dir="$(zoxide query -i)" || return
          zle -U "$dir"
          zle reset-prompt
        }
        zle -N zoxide_zi_insert
        bindkey '^G' zoxide_zi_insert
      '';
    };
  };
}
