{
  den,
  my,
  inputs,
  ...
}:
{
  my.reaper = {
    includes = [
      (den.batteries.unfree [
        "reaper"
        "reaper-config-wrapper"
        "vital"
      ])
      my.desktop
    ];

    homeManager =
      {
        pkgs,
        reaperActions,
        reaperMenus,
        ...
      }:
      let
        reaper-pkgs = inputs.reaper-flake.packages.${pkgs.stdenv.hostPlatform.system};

        wine = pkgs.wineWow64Packages.yabridge;

        reaper-vst-sync = pkgs.writeShellApplication {
          name = "reaper-vst-sync";
          runtimeInputs = [
            pkgs.yabridgectl
          ];
          text = ''
            export WINEPREFIX="$HOME/.wine-reaper"
            vst3_dir="$WINEPREFIX/drive_c/Program Files/Common Files/VST3"
            if [ -d "$vst3_dir" ]; then
              yabridgectl add "$vst3_dir" 2>/dev/null || true
            fi
            yabridgectl sync
          '';
        };

        reaper-vst-install = pkgs.writeShellApplication {
          name = "reaper-vst-install";
          runtimeInputs = [
            wine
            pkgs.yabridgectl
            pkgs.coreutils
          ];
          text = ''
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
                wine "$@"
                ;;
              *.msi)
                wine msiexec /i "$src"
                ;;
              *.vst3)
                name="$(basename "$src")"
                rm -rf "''${vst3_dir:?vst3_dir is not set}/''${name:?name is not set}"
                cp -a -- "$src" "$vst3_dir/$name"
                echo "Installed VST3: $name"
                ;;
              *)
                echo "unsupported file: $src"
                echo "expected .exe, .msi, or .vst3"
                exit 1
                ;;
            esac
            yabridgectl add "$vst3_dir" 2>/dev/null || true
            yabridgectl sync
          '';
        };

        theme-name = "theme.ReaperThemeZip";
        assets-path = ./. + "/../../assets";
        theme-assets = builtins.path {
          path = assets-path;
          name = "reapertips-theme-assets";
          filter = path: type: path == toString assets-path || baseNameOf path == theme-name;
        };
        theme-file = theme-assets + "/${theme-name}";
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

          menus = {
            "${reaperMenus.toolbars.main}".entries = [
              {
                action = 40021;
                label = "Project settings...";
              }
              {
                action = 40025;
                label = "Open project...";
              }
              {
                action = 40026;
                label = "Save project";
              }
              {
                action = 40029;
                label = "Undo";
              }
              {
                action = 40030;
                label = "Redo";
              }
              {
                action = 40023;
                label = "New project...";
              }
              {
                action = 50124;
                label = "Media explorer: Show/hide media explorer";
                icon = "toolbar_item_explode_lane_take.png";
              }
              {
                action = 41589;
                label = "Item properties: Toggle show media item/take properties";
                icon = "toolbar_item_properties.png";
              }
              {
                action = 42411;
                label = "Open selected item source media in explorer/finder";
                icon = "toolbar_zoom_selected.png";
              }
              {
                action = 42432;
                label = "Item: Glue items within time selection";
                icon = "toolbar_glue.png";
              }
              {
                action = 40015;
                label = "File: Render project to disk...";
                icon = "toolbar_audio_waveform_render_disk_mono.png";
              }
              reaperMenus.divider
              {
                action = 40364;
                label = "Enable metronome";
              }
              {
                action = 42616;
                label = "Marquee selection";
                toolbarFlags = 1;
              }
              {
                action = 40041;
                label = "Enable auto-crossfade";
              }
              {
                action = 1156;
                label = "Enable item and track media/razor edit grouping";
              }
              {
                action = 1162;
                label = "Toggle ripple editing";
                toolbarFlags = 1;
              }
              {
                action = 40070;
                label = "Move envelope points with media items";
              }
              {
                action = 1157;
                label = "Enable snapping";
              }
              {
                action = 1135;
                label = "Enable locking";
              }
              {
                action = 42618;
                label = "Razor editing";
                toolbarFlags = 1;
              }
              {
                action = 40145;
                label = "Show arrange view grid";
              }
              {
                action = 40605;
                label = "Show action list";
                icon = "toolbar_misc_question_random.png";
              }
            ];
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
            active = theme-name;
            colorThemes = [
              theme-file
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
