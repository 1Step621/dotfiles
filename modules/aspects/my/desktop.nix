{ my, ... }:
{
  my.desktop = {
    includes = [
      my.sound
      my.input
      my.gnome
      my.gdm
      # my.niri
      my.dank-material-shell
      my.xdg-portal
      my.hyprlock
      my.fuzzel
    ];
  };
}
