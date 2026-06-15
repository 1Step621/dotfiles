{ my, ... }:
{
  my.desktop-basic = {
    includes = [
      my.sound
      my.gnome
      my.gdm
      my.niri
      my.xdg-portal
    ];
  };
}
