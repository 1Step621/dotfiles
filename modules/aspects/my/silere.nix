{ my, ... }:
{
  my.silere = {
    includes = [ my.desktop ];

    homeManager = { pkgs, ... }: {
      home.packages = [ (pkgs.callPackage ../../../packages/silere { }) ];

      xdg.configFile."silere-shell/settings.json".text = builtins.toJSON {
        __version = 1;
        neutralAccent = "#52b8e8";
        compactDate = true;
        calendarWeekNumbers = false;
        barShowShellUpdate = false;
        barShowVolume = false;
        barShowMic = false;
        barShowBrightness = false;
        barShowMedia = false;
        mediaProgress = true;
        mediaVisualizerStyle = "wave";
        mediaVisualizerPosition = "underline";
        mediaVisualizerOpacity = 0.6;
        settingsNavDots = false;
        fontFamily = "RobotoMono Nerd Font";
        notifPopupEnabled = false;
        notifPosition = "top-center";
        notifHistoryPersistent = false;
        notifDefaultTimeout = 2000;
        clockShowDate = true;
        underlineGlow = true;
        underlineLastStyle = "glow";
        underlineIdleGlow = true;
        underlineNotifGlow = true;
        underlineBattGlow = true;
        underlineNetGlow = true;
        underlineScreenshotGlow = true;
        screenshotGlowSweep = false;
        glowStrength = 1.75;
        dotOpacity = 0.3;
        barSeparatorMode = "widgets";
        barSpacing = 4;
        barHeight = 28;
        barFloating = true;
        barWidth = 0.5;
        barRadius = 8;
        barShadow = false;
        barOpacity = 0.4;
        barWidgetOrderLeft = "clock";
        barWidgetOrderCenter = "workspaces,windowTitle";
        barWidgetOrderRight = "shellUpdate,tray,updates,media,bluetooth,microphone,brightness,volume,network,battery";
        baseTone = "charcoal";
        wsMinVisible = 10;
        wsShowNumbers = true;
        wsShowAppIcons = true;
        wsNotifPulse = true;
        wsMenuPulse = true;
        wsIconOpacity = 1;
        wsActiveMarker = "bar";
      };

      services.awww.enable = true;
      programs.cava.enable = true;

      programs.niri.settings = {
        layout.struts.top = -12;
        spawn-at-startup = [
          {
            command = [
              "silere"
              "run"
            ];
          }
        ];
        binds."Mod+Shift+Comma".action.spawn = [
          "silere"
          "ipc"
          "menu"
          "toggle"
        ];
        layer-rules = [
          {
            matches = [ { namespace = "^silere-bar$"; } ];
            background-effect.blur = true;
          }
        ];
      };
    };
  };
}
