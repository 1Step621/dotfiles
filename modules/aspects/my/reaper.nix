{ den, inputs, ... }:
{
  my.reaper = {
    includes = [
      (den.batteries.unfree [
        "reaper"
        "reaper-config-wrapper"
      ])
    ];

    homeManager =
      { pkgs, ... }:
      let
        reaper-pkgs = inputs.reaper-flake.packages.${pkgs.stdenv.hostPlatform.system};
      in
      {
        imports = [
          inputs.reaper-flake.homeModules.reaper
        ];

        programs.reaper = {
          enable = true;

          preferences.plugIns.reascript.python.enable = true;

          extensions = {
            reapack = {
              enable = true;
              repositories = [
                {
                  name = "rejj";
                  url = "https://raw.githubusercontent.com/Justin-Johnson/ReJJ/master/index.xml";
                }
              ];
              packages = [
                {
                  repository = "rejj";
                  category = "ReEQ";
                  name = "ReEQ.jsfx";
                }
              ];
            };
            sws = {
              enable = true;
              colors = [
                "#F5E0E6"
                "#F2CDCD"
                "#F5C2E7"
                "#CBA6F7"
              ];
            };
          };

          theme = {
            active = "Reapertips Theme - Green - Noto CJK JP + Roboto Mono.ReaperThemeZip";
            colorThemes = [
              (./. + "/../../assets/Reapertips Theme - Green - Noto CJK JP + Roboto Mono.ReaperThemeZip")
            ];
          };

          swell.colortheme = {
            enable = true;
            preset = reaper-pkgs.reapertips-theme;
          };

          actions.keyBindings = [
            {
              modifierFlags = 255;
              keyCode = 248;
              command = 977;
              section = 0;
              comment = "MouseWheel -> Scroll horizontally";
            }
            {
              modifierFlags = 255;
              keyCode = 249;
              command = 990;
              section = 0;
              comment = "Ctrl+MouseWheel -> Zoom horizontally";
            }
            {
              modifierFlags = 255;
              keyCode = 253;
              command = 991;
              section = 0;
              comment = "Ctrl+Shift+MouseWheel -> Zoom vertically";
            }
            {
              modifierFlags = 255;
              keyCode = 248;
              command = 40660;
              section = 32060;
              comment = "MouseWheel -> Scroll horizontally (MIDI)";
            }
            {
              modifierFlags = 255;
              keyCode = 249;
              command = 40431;
              section = 32060;
              comment = "Ctrl+MouseWheel -> Zoom horizontally (MIDI)";
            }
            {
              modifierFlags = 255;
              keyCode = 253;
              command = 40430;
              section = 32060;
              comment = "Ctrl+Shift+MouseWheel -> Zoom vertically (MIDI)";
            }
          ];
        };
      };
  };
}
