{
  my.password = {
    os = { user, ... }: {
      users.users."${user.userName}".hashedPassword =
        "$6$AjrxuSz3HiNIFajY$DWbExgNcni7jnMo489Jyi7nymyI.lxXCWD8DEOgrSEXHiIPOagTZYlJ7.0U/YLkM/yWz3Xv5u1PzirYmJvsYC0";
    };
  };
}
