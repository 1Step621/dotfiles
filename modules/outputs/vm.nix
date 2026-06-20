{ inputs, ... }:
{
  perSystem =
    { pkgs, lib, ... }:
    {
      packages = lib.attrsets.mapAttrs' (name: value: {
        name = "vm-${name}";
        value = pkgs.writeShellApplication {
          name = "vm-${name}";
          text = ''
            ${value.config.system.build.vm}/bin/run-${name}-vm "$@"
          '';
        };
      }) inputs.self.nixosConfigurations;
    };
}
