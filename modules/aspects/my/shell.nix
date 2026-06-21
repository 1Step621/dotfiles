{
  my.shell = {
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
        home.file.".config/p10k/.p10k.zsh".source = ../../assets/.p10k.zsh;

        programs.zsh = {
          enable = true;

          autocd = true;
          autosuggestion.enable = true;
          enableCompletion = true;
          syntaxHighlighting.enable = true;

          plugins = [
            {
              name = "powerlevel10k";
              src = pkgs.zsh-powerlevel10k;
              file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
            }
          ];

          initContent = ''
            source "$HOME/.config/p10k/.p10k.zsh"

            setopt interactivecomments

            alias \$=""
          '';
        };
      };
  };
}
