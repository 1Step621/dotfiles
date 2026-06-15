{
  my.networking.os = { user, ... }: {
    os.users.users."${user.userName}".extraGroups = [ "networkmanager" ];
    networking = {
      networkmanager.enable = true;
      firewall.enable = true;
    };
  };
}
