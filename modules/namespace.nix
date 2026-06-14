{ inputs, den, ... }:
{
  imports = [ (inputs.den.namespace "my" true) ];
  _module.args.__findFile = den.lib.__findFile;
}
