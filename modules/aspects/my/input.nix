{ inputs, ... }:
{
  flake-file.inputs.xremap-flake = {
    url = "github:xremap/nix-flake";
    inputs = {
      nixpkgs.follows = "nixpkgs";
      xremap.follows = "";
    };
  };

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
      users.users."${user.userName}".extraGroups = [
        "input"
        "uinput"
      ];
      hardware.uinput.enable = true;
      services.udev.extraRules = ''
        KERNEL=="uinput", GROUP="input", TAG+="uaccess"
      '';
    };
  };
}
