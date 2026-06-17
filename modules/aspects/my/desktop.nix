{ my, ... }:
{
  my.desktop = {
    includes = [
      my.sound
      my.input
      my.bluetooth
      my.fonts
      my.gnome
      my.gdm
      my.niri
      my.dank-material-shell
      my.xdg-portal
      my.gtk-theme
      my.hyprlock
      my.fuzzel
    ];
  };
}
