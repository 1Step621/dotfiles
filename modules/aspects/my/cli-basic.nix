{ my, ... }:
{
  my.cli-basic = {
    includes = [
      my.shell
      my.zsh-abbr
      my.zoxide
      my.fzf
      my.helix
      my.yazi
      my.bat
      my.eza
    ];

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.curl
        pkgs.unzip
        pkgs.wget
        pkgs.ripgrep
        pkgs.fd
        pkgs.ffmpeg
        pkgs.jq
        pkgs.btop
        pkgs.libqalculate
      ];
    };
  };
}
