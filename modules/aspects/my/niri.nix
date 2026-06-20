{ inputs, ... }:
{
  my.niri = {
    os = {
      programs.niri.enable = true;
      services = {
        displayManager.defaultSession = "niri";
        xserver.enable = true;
      };
      virtualisation.vmVariant.virtualisation = {
        graphics = true;
        qemu.options = [
          "-device virtio-vga-gl"
          "-display gtk,gl=on"
        ];
      };
    };

    homeManager = { pkgs, ... }: {
      imports = [ inputs.niri-flake.homeModules.niri ];

      home.packages = [
        pkgs.xwayland-satellite
        pkgs.awww
      ];
      programs.niri = {
        package = pkgs.niri;

        settings = {
          input.keyboard.xkb.layout = "jp";
          binds = {
            "Mod+Shift+Slash".action.show-hotkey-overlay = { };

            "Mod+O".action.toggle-overview = { };
            "Mod+S".action.set-dynamic-cast-window = { };

            "Mod+C".action.close-window = { };
            "Mod+W".action.toggle-window-floating = { };
            "Mod+R".action.switch-preset-column-width = { };
            "Mod+F".action.maximize-column = { };
            "Mod+G".action.fullscreen-window = { };
            "Mod+Comma".action.consume-window-into-column = { };
            "Mod+Period".action.expel-window-from-column = { };

            "Mod+Left".action.focus-column-or-monitor-left = { };
            "Mod+Down".action.focus-window-or-workspace-down = { };
            "Mod+Up".action.focus-window-or-workspace-up = { };
            "Mod+Right".action.focus-column-or-monitor-right = { };
            "Mod+H".action.focus-column-or-monitor-left = { };
            "Mod+J".action.focus-window-or-workspace-down = { };
            "Mod+K".action.focus-window-or-workspace-up = { };
            "Mod+L".action.focus-column-or-monitor-right = { };

            "Mod+Shift+Left".action.move-column-left-or-to-monitor-left = { };
            "Mod+Shift+Down".action.move-window-down-or-to-workspace-down = { };
            "Mod+Shift+Up".action.move-window-up-or-to-workspace-up = { };
            "Mod+Shift+Right".action.move-column-right-or-to-monitor-right = { };
            "Mod+Shift+H".action.move-column-left-or-to-monitor-left = { };
            "Mod+Shift+J".action.move-window-down-or-to-workspace-down = { };
            "Mod+Shift+K".action.move-window-up-or-to-workspace-up = { };
            "Mod+Shift+L".action.move-column-right-or-to-monitor-right = { };

            "Mod+Ctrl+Left".action.consume-or-expel-window-left = { };
            "Mod+Ctrl+Right".action.consume-or-expel-window-right = { };
            "Mod+Ctrl+H".action.consume-or-expel-window-left = { };
            "Mod+Ctrl+L".action.consume-or-expel-window-right = { };

            "Mod+WheelScrollDown" = {
              cooldown-ms = 150;
              action.focus-workspace-down = { };
            };
            "Mod+WheelScrollUp" = {
              cooldown-ms = 150;
              action.focus-workspace-up = { };
            };
            "Mod+Ctrl+WheelScrollDown" = {
              cooldown-ms = 150;
              action.move-column-to-workspace-down = { };
            };
            "Mod+Ctrl+WheelScrollUp" = {
              cooldown-ms = 150;
              action.move-column-to-workspace-up = { };
            };

            "Mod+WheelScrollRight".action.focus-column-right = { };
            "Mod+WheelScrollLeft".action.focus-column-left = { };
            "Mod+Ctrl+WheelScrollRight".action.move-column-right = { };
            "Mod+Ctrl+WheelScrollLeft".action.move-column-left = { };

            "Mod+Shift+WheelScrollDown".action.focus-column-right = { };
            "Mod+Shift+WheelScrollUp".action.focus-column-left = { };
            "Mod+Ctrl+Shift+WheelScrollDown".action.move-column-right = { };
            "Mod+Ctrl+Shift+WheelScrollUp".action.move-column-left = { };

            "Mod+1".action.focus-workspace = 1;
            "Mod+2".action.focus-workspace = 2;
            "Mod+3".action.focus-workspace = 3;
            "Mod+4".action.focus-workspace = 4;
            "Mod+5".action.focus-workspace = 5;
            "Mod+6".action.focus-workspace = 6;
            "Mod+7".action.focus-workspace = 7;
            "Mod+8".action.focus-workspace = 8;
            "Mod+9".action.focus-workspace = 9;
            "Mod+Ctrl+1".action.move-column-to-workspace = 1;
            "Mod+Ctrl+2".action.move-column-to-workspace = 2;
            "Mod+Ctrl+3".action.move-column-to-workspace = 3;
            "Mod+Ctrl+4".action.move-column-to-workspace = 4;
            "Mod+Ctrl+5".action.move-column-to-workspace = 5;
            "Mod+Ctrl+6".action.move-column-to-workspace = 6;
            "Mod+Ctrl+7".action.move-column-to-workspace = 7;
            "Mod+Ctrl+8".action.move-column-to-workspace = 8;
            "Mod+Ctrl+9".action.move-column-to-workspace = 9;

            "Mod+Alt+Left".action.set-column-width = "-10%";
            "Mod+Alt+Right".action.set-column-width = "+10%";

            "Mod+Alt+Up".action.set-window-height = "-10%";
            "Mod+Alt+Down".action.set-window-height = "+10%";

            "Print".action.spawn-sh = [
              "niri msg action screenshot"
            ];
          };
          input = {
            focus-follows-mouse = {
              max-scroll-amount = "0%";
              enable = true;
            };
            warp-mouse-to-focus.enable = true;
            touchpad.dwt = true;
          };
          gestures.hot-corners.enable = false;
          prefer-no-csd = true;
          hotkey-overlay.skip-at-startup = true;
          cursor.theme = "Bibata-Modern-Classic";
          cursor.hide-after-inactive-ms = 10000;
          layout = {
            tab-indicator = {
              width = 4;
              gap = 8;
              corner-radius = 2;
              length.total-proportion = 0.5;
              place-within-column = true;
              hide-when-single-tab = true;
              active.color = "#61afef";
              inactive.color = "#282c34";
            };
            default-column-width.proportion = 0.5;
            focus-ring = {
              active.gradient = {
                angle = 45;
                from = "#61afef75";
                to = "#3688cb75";
                in' = "oklab";
                relative-to = "workspace-view";
              };
              inactive.color = "#282c34";
            };
          };
          overview.backdrop-color = "#21252b";
          window-rules = [
            {
              clip-to-geometry = true;
              geometry-corner-radius = {
                top-left = 8.0;
                top-right = 8.0;
                bottom-left = 8.0;
                bottom-right = 8.0;
              };
              default-column-display = "tabbed";
            }
            {
              matches = [
                {
                  is-window-cast-target = true;
                }
              ];
              focus-ring.active.gradient = {
                angle = 45;
                from = "#e06c75";
                to = "#bb454f";
                in' = "oklab";
                relative-to = "workspace-view";
              };
              tab-indicator.active.color = "#e06c75";
              shadow = {
                enable = true;
                color = "#e06c7540";
              };
            }
            {
              matches = [
                {
                  is-floating = true;
                }
              ];
              background-effect = {
                blur = false;
              };
            }
          ];
        };
      };
    };
  };
}
