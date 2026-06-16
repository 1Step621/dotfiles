{
  my.gui-hobby.homeManager = { pkgs, ... }: {
    home.packages = [
      pkgs.gapless
    ];
  };
}
