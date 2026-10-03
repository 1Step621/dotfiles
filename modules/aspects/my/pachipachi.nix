{ inputs, my, ... }:
{
  flake-file.inputs.pachipachi.url = "github:1Step621/pachipachi";

  my.pachipachi = {
    includes = [ my.desktop ];

    homeManager = { pkgs, ... }: {
      home.packages = [ inputs.pachipachi.packages.${pkgs.stdenv.hostPlatform.system}.default ];

      programs.niri.settings = {
        spawn-at-startup = [
          { command = [ "pachipachi" ]; }
        ];
        layer-rules = [
          {
            matches = [ { namespace = "^pachipachi$"; } ];
            opacity = 0.5;
          }
        ];
      };
    };
  };
}
