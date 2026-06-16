{
  my.hyprlock = {
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = false;
          hide_cursor = true;
          no_fade_in = false;
        };

        background = [
          {
            path = "~/Wallpapers/lockscreen.png";
          }
        ];

        input-field = [
          {
            size = "300, 50";

            outline_thickness = 0;
            outer_color = "rgba(0, 0, 0, 0.0)";
            inner_color = "rgba(0, 0, 0, 0.0)";
            font_color = "rgb(255, 255, 255)";
            check_color = "rgba(0, 0, 0, 0.0)";
            fail_color = "rgba(0, 0, 0, 0.0)";
            capslock_color = "rgba(0, 0, 0, 0.0)";
            numlock_color = "rgba(0, 0, 0, 0.0)";
            bothlock_color = "rgba(0, 0, 0, 0.0)";

            fade_on_empty = false;
            placeholder_text = "Type Password";
            fail_text = "Authentication Failed";

            dots_spacing = 0.2;
            dots_center = true;
          }
        ];

        label = [
          {
            text = "$TIME";

            font_family = "Inter Bold";
            font_size = 50;

            position = "0, 60";

            valign = "center";
            halign = "center";
          }
        ];
      };
    };
  };
}
