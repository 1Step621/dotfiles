{ inputs, my, ... }:
{
  flake-file.inputs.zen-browser-flake = {
    url = "github:0xc000022070/zen-browser-flake";
    inputs.nixpkgs.follows = "nixpkgs";
    inputs.home-manager.follows = "home-manager";
  };

  my.zen-browser = {
    includes = [ my.desktop ];

    homeManager = {
      imports = [
        inputs.zen-browser-flake.homeModules.beta
      ];

      programs.zen-browser = {
        enable = true;
        policies = {
          DisableAppUpdate = true;
          DisableTelemetry = true;
        };
      };

      programs.niri.settings.window-rules = [
        {
          matches = [
            {
              app-id = "zen";
              title = "ピクチャーインピクチャー";
            }
            {
              app-id = "zen";
              title = "Picture-in-Picture";
            }
          ];
          open-floating = true;
          default-column-width.fixed = 480;
          default-window-height.fixed = 270;
        }
      ];

      xdg.mimeApps.defaultApplications = {
        "text/html" = "zen-beta.desktop";
        "x-scheme-handler/http" = "zen-beta.desktop";
        "x-scheme-handler/https" = "zen-beta.desktop";
        "x-scheme-handler/about" = "zen-beta.desktop";
        "x-scheme-handler/unknown" = "zen-beta.desktop";
      };

      home.sessionVariables.BROWSER = "zen-beta";
    };
  };
}
