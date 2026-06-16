{
  my.fuzzel.homeManager = {
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
}
