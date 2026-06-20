{ my, inputs, ... }:
{
  my.gui-basic = {
    includes = [
      my.desktop
      my.kitty
      my.zed-editor
      my.zen-browser
    ];

    homeManager = { pkgs, ... }: {
      programs.niri.settings.binds = {
        "Mod+P".action.spawn = [
          "hyprpicker"
          "--autocopy"
        ];
        "Ctrl+Print".action.spawn-sh = [
          "wf-recorder-toggle -f \"$HOME/Videos/screencaptures/$(date +%F-%H-%M-%S).mp4\""
        ];
        "XF86MonBrightnessUp" = {
          allow-when-locked = true;
          action.spawn = [
            "brightnessctl"
            "set"
            "5%+"
          ];
        };
        "XF86MonBrightnessDown" = {
          allow-when-locked = true;
          action.spawn = [
            "brightnessctl"
            "set"
            "5%-"
          ];
        };
      };

      home.packages = [
        pkgs.wlr-randr
        pkgs.pavucontrol
        pkgs.xdg-utils
        pkgs.playerctl
        pkgs.pamixer
        pkgs.brightnessctl
        pkgs.wl-clipboard
        pkgs.nautilus
        pkgs.ripdrag
        pkgs.grim
        pkgs.slurp
        pkgs.wf-recorder
        inputs.nur-yadokani.packages.${pkgs.stdenv.hostPlatform.system}.wf-recorder-toggle
        pkgs.hyprpicker
      ];
    };
  };
}
