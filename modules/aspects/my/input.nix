{ inputs, ... }:
{
  my.input.homeManager = { pkgs, ... }: {
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
}
