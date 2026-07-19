{ inputs, my, ... }:
{
  my.dank-material-shell = {
    includes = [ my.desktop ];

    homeManager = { pkgs, ... }: {
      imports = [
        inputs.dms.homeModules.dank-material-shell
      ];

      programs.niri.settings = {
        binds."Mod+V".action.spawn = [
          "dms"
          "ipc"
          "clipboard"
          "open"
        ];
        layer-rules = [
          {
            matches = [
              {
                namespace = "dms";
              }
            ];
            background-effect = {
              xray = false;
            };
          }
        ];
      };
      programs.dank-material-shell = {
        enable = true;
        dgop.package = inputs.dgop.packages.${pkgs.stdenv.hostPlatform.system}.default;
        systemd = {
          enable = true;
          restartIfChanged = true;
        };
        settings = {
          currentThemeName = "blue";
          runUserMatugenTemplates = false;
          popupTransparency = 0.75;
          animationSpeed = 2;
          popoutAnimationSpeed = 2;
          enableRippleEffects = false;
          blurEnabled = true;
          controlCenterWidgets = [
            {
              enabled = true;
              id = "volumeSlider";
              width = 50;
            }
            {
              enabled = true;
              id = "brightnessSlider";
              width = 50;
            }
            {
              enabled = true;
              id = "wifi";
              width = 50;
            }
            {
              enabled = true;
              id = "bluetooth";
              width = 50;
            }
            {
              enabled = true;
              id = "audioOutput";
              width = 50;
            }
            {
              enabled = true;
              id = "audioInput";
              width = 50;
            }
          ];
          dashTabs = [
            {
              id = "overview";
              enabled = true;
            }
            {
              id = "media";
              enabled = true;
            }
            {
              id = "wallpaper";
              enabled = false;
            }
            {
              id = "weather";
              enabled = false;
            }
            {
              id = "settings";
              enabled = true;
            }
          ];
          showWorkspaceIndex = true;
          showWorkspaceApps = true;
          maxWorkspaceIcons = 99;
          groupWorkspaceApps = false;
          showOccupiedWorkspacesOnly = true;
          workspaceUnfocusedColorMode = "sch";
          workspaceFocusedBorderColor = "secondary";
          workspaceFocusedBorderThickness = 1;
          waveProgressEnabled = false;
          mediaAdaptiveWidthEnabled = false;
          audioVisualizerEnabled = false;
          clockDateFormat = "M/d ddd";
          clockFormat = "24h";
          appDrawerSectionViewModes = {
            apps = "list";
          };
          weatherEnabled = false;
          networkPreference = "wifi";
          launcherLogoColorOverride = "#ffffff";
          monoFontFamily = "Roboto Mono [GOOG]";
          useSystemSoundTheme = true;
          loginctlLockIntegration = false;
          runDmsMatugenTemplates = false;
          matugenTemplateGtk = false;
          dockAutoHide = true;
          notificationOverlayEnabled = true;
          lockScreenShowPowerActions = false;
          lockScreenShowSystemIcons = false;
          lockScreenShowTime = false;
          lockScreenShowDate = false;
          lockScreenShowProfileImage = false;
          lockScreenShowPasswordField = false;
          lockScreenShowMediaPlayer = false;
          osdPosition = 4;
          powerMenuActions = [
            "lock"
            "poweroff"
            "reboot"
          ];
          screenPreferences = {
            dock = [
              "all"
            ];
            notifications = [
              "all"
            ];
            osd = [
              "all"
            ];
            toast = [
              "all"
            ];
            wallpaper = [
              "all"
            ];
          };
          showOnLastDisplay = {
            dock = false;
            notifications = false;
            osd = false;
            toast = true;
          };
          barConfigs = [
            {
              autoHide = false;
              autoHideDelay = 250;
              borderColor = "surfaceText";
              borderEnabled = false;
              borderOpacity = 0.02;
              borderThickness = 1;
              bottomGap = 0;
              centerWidgets = [
                {
                  id = "clock";
                  enabled = true;
                }
              ];
              clickThrough = true;
              enabled = true;
              fontScale = 1;
              gothCornerRadiusOverride = false;
              gothCornerRadiusValue = 12;
              gothCornersEnabled = false;
              iconScale = 1;
              id = "default";
              innerPadding = 0;
              leftWidgets = [
                {
                  id = "cpuUsage";
                  enabled = true;
                  minimumWidth = false;
                }
                {
                  id = "workspaceSwitcher";
                  enabled = true;
                }
              ];
              maximizeDetection = true;
              maximizeWidgetIcons = false;
              maximizeWidgetText = false;
              name = "Main Bar";
              noBackground = true;
              openOnOverview = true;
              popupGapsAuto = true;
              popupGapsManual = 25;
              position = 0;
              removeWidgetPadding = false;
              rightWidgets = [
                {
                  enabled = true;
                  id = "notificationButton";
                }
                {
                  enabled = true;
                  id = "battery";
                }
                {
                  id = "controlCenterButton";
                  enabled = true;
                  showBluetoothIcon = false;
                  showAudioIcon = false;
                  showAudioPercent = false;
                  showVpnIcon = false;
                }
              ];
              screenPreferences = [
                "all"
              ];
              scrollEnabled = true;
              scrollXBehavior = "column";
              scrollYBehavior = "workspace";
              shadowColorMode = "text";
              shadowCustomColor = "#000000";
              shadowIntensity = 0;
              shadowOpacity = 60;
              showOnLastDisplay = true;
              showOnWindowsOpen = false;
              spacing = 0;
              squareCorners = true;
              transparency = 0.74;
              visible = true;
              widgetOutlineColor = "primary";
              widgetOutlineEnabled = false;
              widgetOutlineOpacity = 0.07;
              widgetOutlineThickness = 1;
              widgetPadding = 8;
              widgetTransparency = 1;
            }
          ];
          builtInPluginSettings = {
            dms_notepad = {
              enabled = false;
            };
            dms_settings_search = {
              enabled = false;
              trigger = "?";
            };
            dms_sysmon = {
              enabled = false;
            };
          };
          clipboardEnterToPaste = true;
          clipboardClickToPaste = true;
        };
      };
    };
  };
}
