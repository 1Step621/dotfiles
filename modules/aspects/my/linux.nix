{
  my.linux = {
    os = { pkgs, lib, ... }: {
      boot = {
        kernelPackages = pkgs.linuxPackages_latest;
        tmp.useTmpfs = true;
        loader = {
          efi.canTouchEfiVariables = true;
          systemd-boot.enable = lib.mkForce false;
          grub.enable = lib.mkForce false;
          limine = {
            enable = true;
            efiSupport = true;
            maxGenerations = 10;
            style.wallpapers = [ ];
            style = {
              graphicalTerminal.palette = "24273a;ed8796;a6da95;eed49f;8aadf4;f5bde6;8bd5ca;cad3f5";
              graphicalTerminal.brightPalette = "5b6078;ed8796;a6da95;eed49f;8aadf4;f5bde6;8bd5ca;cad3f5";
              graphicalTerminal.background = "24273a";
              graphicalTerminal.foreground = "cad3f5";
              graphicalTerminal.brightBackground = "5b6078";
              graphicalTerminal.brightForeground = "cad3f5";
              interface.brandingColor = "8aadf4";
              interface.helpColor = "8aadf4";
              interface.helpColorBright = "8aadf4";
            };
          };
        };
        binfmt.emulatedSystems = [ "aarch64-linux" ];
      };
    };
  };
}
