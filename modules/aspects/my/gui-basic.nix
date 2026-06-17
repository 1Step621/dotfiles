{ my, inputs, ... }:
{
  my.gui-basic = {
    includes = [
      my.kitty
      my.zed-editor
      my.zen-browser
    ];

    homeManager = { pkgs, ... }: {
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
