{ config, ... }:
{
  age.secrets.q-password.file = ../secrets/q-password.age;

  users.users.q = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "headscale"
    ];
    hashedPasswordFile = config.age.secrets.q-password.path;
    openssh.authorizedKeys.keys = import ./_sshkeys.nix;
  };
}
