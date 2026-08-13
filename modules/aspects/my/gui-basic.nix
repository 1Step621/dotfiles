{ my, ... }:
{
  my.gui-basic = {
    includes = [
      my.desktop
      my.kitty
      my.zed-editor
      my.zen-browser
      my.ripdrag
      my.xdg-utils
      my.wl-screenrec
    ];

    homeManager = { pkgs, ... }: {
      programs.niri.settings.binds = {
        "Mod+P".action.spawn = [
          "hyprpicker"
          "--autocopy"
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
        pkgs.playerctl
        pkgs.pamixer
        pkgs.brightnessctl
        pkgs.wl-clipboard
        pkgs.nautilus
        pkgs.grim
        pkgs.pulseaudio
        pkgs.hyprpicker
      ];
    };
  };
}
