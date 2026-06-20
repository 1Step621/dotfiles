{ my, ... }:
{
  my.helix = {
    includes = [ my.shell ];

    homeManager = {
      programs.helix = {
        enable = true;
        settings.theme = "onedark";
      };
      home.sessionVariables = {
        EDITOR = "hx";
      };
    };
  };
}
