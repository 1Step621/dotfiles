{ inputs, my, ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      diag = inputs.den-diagram.lib;
      mmd = diag.toMermaid (
        diag.graph.ofNamespace {
          aspects = my;
        }
      );
      mmdFile = pkgs.writeText "diagram.mmd" mmd;
    in
    {
      packages.diag = pkgs.writeShellApplication {
        name = "diag";
        runtimeInputs = [
          pkgs.mermaid-cli
          pkgs.xdg-utils
        ];
        text = ''
          mmdc -i ${mmdFile} -o /tmp/diagram.png -s 10
          xdg-open /tmp/diagram.png
        '';
      };
    };
}
