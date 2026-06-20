{
  my.networking = {
    os = { user, ... }: {
      users.users."${user.userName}".extraGroups = [ "networkmanager" ];
      networking = {
        networkmanager.enable = true;
        firewall.enable = true;
      };
    };
  };
}
