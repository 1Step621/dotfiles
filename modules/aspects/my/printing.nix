{
  my.printing = {
    os = {
      services.printing.enable = true;
      services.avahi = {
        enable = true;
        nssmdns4 = true;
        nssmdns6 = true;
        openFirewall = true;
      };
    };
  };
}
