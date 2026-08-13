{ den, inputs, ... }:
{
  my.reaper = {
    includes = [
      (den.batteries.unfree [
        "reaper"
        "reaper-config-wrapper"
        "vital"
      ])
    ];

    homeManager =
      { pkgs, reaperActions, ... }:
      let
        reaper-pkgs = inputs.reaper-flake.packages.${pkgs.stdenv.hostPlatform.system};

        wine = pkgs.wineWow64Packages.yabridge;

        reaper-vst-sync = pkgs.writeShellScriptBin "reaper-vst-sync" ''
          set -euo pipefail
          export WINEPREFIX="$HOME/.wine-reaper"
          vst3_dir="$WINEPREFIX/drive_c/Program Files/Common Files/VST3"
          if [ -d "$vst3_dir" ]; then
            ${pkgs.yabridgectl}/bin/yabridgectl add "$vst3_dir" 2>/dev/null || true
          fi
          ${pkgs.yabridgectl}/bin/yabridgectl sync
        '';

        reaper-vst-install = pkgs.writeShellScriptBin "reaper-vst-install" ''
          set -euo pipefail
          if [ "$#" -eq 0 ]; then
            echo "usage: reaper-vst-install <installer.exe|installer.msi|plugin.vst3>"
            exit 1
          fi
          export WINEPREFIX="$HOME/.wine-reaper"
          src="$1"
          vst3_dir="$WINEPREFIX/drive_c/Program Files/Common Files/VST3"
          mkdir -p "$vst3_dir"
          case "$src" in
            *.exe)
              ${wine}/bin/wine "$@"
              ;;
            *.msi)
              ${wine}/bin/wine msiexec /i "$src"
              ;;
            *.vst3)
              name="$(basename "$src")"
              rm -rf "$vst3_dir/$name"
              cp -a -- "$src" "$vst3_dir/$name"
              echo "Installed VST3: $name"
              ;;
            *)
              echo "unsupported file: $src"
              echo "expected .exe, .msi, or .vst3"
              exit 1
              ;;
          esac
          ${pkgs.yabridgectl}/bin/yabridgectl add "$vst3_dir" 2>/dev/null || true
          ${pkgs.yabridgectl}/bin/yabridgectl sync
        '';
      in
      {
        imports = [
          inputs.reaper-flake.homeModules.reaper
        ];

        home.packages = [
          pkgs.vital
          (pkgs.distrho-ports.override {
            plugins = [
              "dexed"
              "obxd"
              "luftikus"
              "tal-filter-2"
              "klangfalter"
            ];
          })
          wine
          pkgs.yabridge
          pkgs.yabridgectl
          reaper-vst-install
          reaper-vst-sync
        ];

        programs.reaper = {
          enable = true;

          packages = [
            pkgs.freetype
            pkgs.libpng
            pkgs.zlib
            pkgs.fontconfig
            pkgs.libepoxy
            pkgs.gtk3
            pkgs.cairo
            pkgs.glib
          ];

          preferences = {
            appearance.zoomScrollOffset.horizontalZoomCenter = 3;
            general.paths.peakCache = {
              storeAllInAlternatePath = true;
              useAlternatePathForPaths = "/tmp";
            };
            project.defaultProjectTemplate = "${../../assets/default.RPP}";
            plugIns.reascript.python.enable = true;
          };

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
          ]
          ++ reaperActions.bindings [
            (reaperActions.shortcut {
              shortcut = "Ctrl+:";
              command = 50124;
              actionName = "Show/hide media explorer";
            })
            (reaperActions.shortcut {
              shortcut = "Ctrl+NumpadAdd";
              command = 50124;
              actionName = "Show/hide media explorer";
            })
          ];
        };
      };
  };
}
