{ inputs, ... }:
{
  my.nix-index = {
    homeManager = {
      imports = [
        inputs.nix-index-database.homeModules.nix-index
      ];
      programs = {
        nix-index.enable = true;
        nix-index-database.comma.enable = true;
      };
    };
  };
}
