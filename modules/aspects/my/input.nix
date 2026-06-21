{ inputs, ... }:
{
  my.input = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.fcitx5-mellow-themes
      ];
      imports = [ inputs.xremap-flake.homeManagerModules.default ];
      i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5 = {
          waylandFrontend = true;
          addons = [
            pkgs.fcitx5-mozc-ut
            inputs.nur-yadokani.packages.${pkgs.stdenv.hostPlatform.system}.karukan-im-gpu
          ];
        };
      };
      services.xremap = {
        enable = true;
        package = pkgs.xremap;
        watch = true;
        config = {
          modmap = [
            {
              remap.CapsLock = "Esc";
            }
          ];
        };
      };
    };
    os = { user, ... }: {
      users.users."${user.userName}".extraGroups = [ "input" ];
      hardware.uinput.enable = true;
      services.udev.extraRules = ''
        KERNEL=="uinput", GROUP="input", TAG+="uaccess"
      '';
    };
  };
}
