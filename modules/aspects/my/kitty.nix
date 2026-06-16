{
  my.kitty = {
    programs.kitty = {
      enable = true;
      extraConfig = ''
        # zshell
        shell zsh

        auto_reload_config -1

        # Remove close window confirm
        confirm_os_window_close 0

        window_padding_width 5 10

        font_family Roboto Mono
        font_size 12.0

        map ctrl+shift+; change_font_size all +2.0

        background_opacity 0.75
        background_blur 1

        allow_remote_control yes
        dynamic_background_opacity yes

        # One Dark base
        foreground              #ABB2BF
        background              #282C34

        cursor                  #ABB2BF
        cursor_text_color       #282C34

        url_color               #61AFEF

        active_border_color     #61AFEF
        inactive_border_color   #3E4451
        bell_border_color       #E5C07B

        wayland_titlebar_color system
        macos_titlebar_color system

        # Tabs
        active_tab_foreground   #282C34
        active_tab_background   #61AFEF
        inactive_tab_foreground #ABB2BF
        inactive_tab_background #21252B
        tab_bar_background      #21252B

        # Marks
        mark1_foreground #282C34
        mark1_background #61AFEF
        mark2_foreground #282C34
        mark2_background #98C379
        mark3_foreground #282C34
        mark3_background #E5C07B

        # 16 colors (One Dark)
        color0  #3F4451
        color8  #4F5666

        color1  #E06C75
        color9  #E06C75

        color2  #98C379
        color10 #98C379

        color3  #E5C07B
        color11 #E5C07B

        color4  #61AFEF
        color12 #61AFEF

        color5  #C678DD
        color13 #C678DD

        color6  #56B6C2
        color14 #56B6C2

        color7  #ABB2BF
        color15 #FFFFFF
      '';
    };
  };
}
