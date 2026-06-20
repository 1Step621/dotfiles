{ my, ... }:
{
  my.yazi = {
    includes = [ my.shell ];

    homeManager =
      { pkgs, ... }:
      {
        programs.yazi = {
          enable = true;

          enableZshIntegration = true;

          plugins = {
            inherit (pkgs.yaziPlugins) full-border;
          };

          initLua = ''
            require("full-border"):setup()
          '';

          theme = {
            indicator.padding = {
              open = "▐";
              close = "▌";
            };
            mode = {
              normal_alt = {
                fg = "black";
                bg = "gray";
              };
              select_alt = {
                fg = "black";
                bg = "gray";
              };
            };
            status = {
              overall.fg = "black";
              progress_label.fg = "black";
              sep_left = {
                open = "";
                close = "";
              };
              sep_right = {
                open = "";
                close = "";
              };
            };
          };

          settings = {
            opener.pdf = [
              {
                run = "tdf %s";
                block = true;
                desc = "PDF viewer";
                for = "unix";
              }
            ];

            open.prepend_rules = [
              {
                mime = "application/pdf";
                use = "pdf";
              }
            ];
          };
        };
      };
  };
}
