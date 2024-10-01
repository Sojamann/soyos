{ user-config, ...}:
{
  programs.git = {
    enable = true;
    userName = "${user-config.first-name} ${user-config.last-name}";
    userEmail = user-config.email;
  };
}
