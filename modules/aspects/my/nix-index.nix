{
  my.nix-index.homeManager =
    { flake, ... }:
    {
      imports = [ flake.modules.homeManager.nix-index ];
      programs = {
        nix-index.enable = true;
        nix-index-database.comma.enable = true;
      };
    };
}
