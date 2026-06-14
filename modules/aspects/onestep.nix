{ den, my, ... }:
{
  den.aspects.onestep = {
    includes = [
      den.batteries.hostname
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "zsh")
      (den.batteries.unfree [ "zsh-abbr" ])
      {
        os.nix.settings.trusted-users = [
          "root"
          "onestep"
        ];
        os.users.users.onestep = {
          hashedPassword = "$6$AjrxuSz3HiNIFajY$DWbExgNcni7jnMo489Jyi7nymyI.lxXCWD8DEOgrSEXHiIPOagTZYlJ7.0U/YLkM/yWz3Xv5u1PzirYmJvsYC0";
          extraGroups = [
            "networkmanager"
            "wheel"
            "audio"
            "video"
            "input"
          ];
        };
      }
      my.cli-basic
      my.cli-development
      my.cli-hobby
      my.gdm
      my.niri
    ];
  };
}
