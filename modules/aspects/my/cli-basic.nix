{ my, ... }:
{
  my.cli-basic = {
    includes = [
      my.zsh
      my.zsh-abbr
      my.helix
      my.yazi
      my.zoxide
    ];

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.curl
        pkgs.bat
        pkgs.unzip
        pkgs.wget
        pkgs.ripgrep
        pkgs.eza
        pkgs.fd
        pkgs.ffmpeg
        pkgs.jq
        pkgs.btop
      ];
    };
  };
}
