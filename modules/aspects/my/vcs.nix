{ my, ... }:
{
  my.vcs = {
    includes = [ my.shell ];

    homeManager =
      { pkgs, ... }:
      {
        programs.gpg = {
          enable = true;
        };
        services.gpg-agent = {
          enable = true;
          pinentry.package = pkgs.pinentry-curses;
        };
        programs.git = {
          enable = true;
          settings = {
            init.defaultBranch = "main";
            pull = {
              rebase = true;
              autostash = true;
            };
            rebase.autostash = true;
            credential = {
              helper = "cache";
              "https://github.com".helper = "!${pkgs.gh}/bin/gh auth git-credential";
              "https://gist.github.com".helper = "!${pkgs.gh}/bin/gh auth git-credential";
            };
            gpg.program = "gpg";
            commit.gpgsign = true;
            push.autoSetupRemote = true;
            merge.conflictstyle = "diff3";
            merge.mergiraf = {
              name = "${pkgs.mergiraf}/bin/mergiraf";
              driver = "${pkgs.mergiraf}/bin/mergiraf merge --git %O %A %B -s %S -x %X -y %Y -p %P -l %L";
            };
            url."https://github.com/".insteadOf = [
              "gh:"
              "github:"
            ];
            alias.undo = "reset --soft HEAD^";
            core.pager = "${pkgs.delta}/bin/delta";
            interactive.diffFilter = "${pkgs.delta}/bin/delta --color-only";
            delta = {
              navigate = true;
              dark = true;
            };
          };
          ignores = [
            ".direnv/"
          ];
          attributes = [
            "* merge=${pkgs.mergiraf}/bin/mergiraf"
          ];
        };
      };
  };
}
