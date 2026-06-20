{
  my.fonts = {
    os = { pkgs, ... }: {
      fonts = {
        enableDefaultPackages = false;
        packages = [
          pkgs.noto-fonts-cjk-sans
          pkgs.noto-fonts-cjk-sans-static
          pkgs.noto-fonts-cjk-serif
          pkgs.noto-fonts-color-emoji
          pkgs.noto-fonts-monochrome-emoji
          pkgs.noto-fonts
          pkgs.twemoji-color-font
          pkgs.roboto-mono
          pkgs.inter
          pkgs.lmmath
          pkgs.nerd-fonts.roboto-mono
          pkgs.nerd-fonts.noto
        ];
        fontconfig = {
          defaultFonts = {
            serif = [
              "Noto Serif CJK JP"
              "Noto Emoji"
            ];
            sansSerif = [
              "Inter"
              "Noto Sans CJK JP"
              "Noto Emoji"
            ];
            monospace = [
              "RobotoMono Nerd Font Mono"
              "Noto Sans CJK JP"
              "Noto Emoji"
            ];
            emoji = [ "Noto Emoji" ];
          };
          localConf = ''
            <?xml version="1.0"?>
            <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
            <fontconfig>

              <match target="pattern">
                <test name="family" qual="any" compare="contains">
                  <string>Noto Sans</string>
                </test>
                <edit name="family" mode="prepend" binding="strong">
                  <string>Inter</string>
                </edit>
              </match>

              <match>
                <test name="family" compare="eq">
                  <string>Consolas</string>
                </test>
                <edit name="family" mode="assign" binding="strong">
                  <string>Roboto Mono</string>
                </edit>
              </match>

            </fontconfig>
          '';
        };
      };
    };
  };
}
