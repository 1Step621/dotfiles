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
      my.xdg-portal
      my.gtk-theme
      my.hyprlock
      my.dank-material-shell
      my.fuzzel
    ];
  };
}
