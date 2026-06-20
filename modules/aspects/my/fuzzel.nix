{ my, ... }:
{
  my.fuzzel = {
    includes = [ my.desktop ];

    homeManager = {
      programs.niri.settings = {
        binds."Mod+D".action.spawn = "fuzzel";
        layer-rules = [
          {
            matches = [
              {
                namespace = "launcher";
              }
            ];
            geometry-corner-radius = {
              top-left = 8.0;
              top-right = 8.0;
              bottom-left = 8.0;
              bottom-right = 8.0;
            };
            shadow = {
              enable = true;
              color = "#21252b3c";
              offset = {
                x = 0;
                y = 15;
              };
              softness = 35;
              spread = 10;
            };
            background-effect = {
              blur = true;
              xray = false;
            };
          }
        ];
      };
      programs.fuzzel = {
        enable = true;
        settings = {
          main = {
            font = "Inter:size=10";
            line-height = 17;
            image-size-ratio = 1;
            prompt = "\"\"";
            inner-pad = 10;
            lines = 5;
          };
          colors = {
            background = "282c34dd";
            text = "abb2bfff";
            match = "61afefff";
            selection-match = "282c34ff";
            selection = "61afefdd";
            selection-text = "282c34ff";
            border = "333842ff";
          };
          border = {
            radius = 8;
            selection-radius = 8;
          };
          key-bindings = {
            delete-line-forward = "none";
            prev = "Up Control+k";
            next = "Down Control+j";
          };
        };
      };
    };
  };
}
