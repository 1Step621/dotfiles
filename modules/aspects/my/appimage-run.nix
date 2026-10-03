{ my, ... }:
{
  my.appimage-run = {
    includes = [ my.desktop ];

    os = {
      programs.appimage = {
        enable = true;
        binfmt = true;
      };
    };
  };
}
