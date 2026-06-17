{ my, ... }:
{
  my.cli-basic = {
    includes = [
      my.shell
      my.helix
      my.yazi
    ];

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.curl
        pkgs.fzf
        pkgs.bat
        pkgs.unzip
        pkgs.wget
        pkgs.ripgrep
        pkgs.eza
        pkgs.fd
        pkgs.ffmpeg
        pkgs.jq
        pkgs.btop
        pkgs.libqalculate
      ];
    };
  };
}
