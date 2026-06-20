{ my, ... }:
{
  my.gapless = {
    includes = [ my.desktop ];

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.gapless
      ];

      programs.niri.settings.window-rules = [
        {
          matches = [
            {
              app-id = "com.github.neithern.g4music";
            }
          ];
          open-floating = true;
          default-column-width.fixed = 800;
          default-window-height.fixed = 500;
        }
      ];
    };
  };
}
