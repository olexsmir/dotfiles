{ config, ... }:
let
  ssh-keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPLLJdkVYKZgsayw+sHanKPKZbI0RMS2CakqBCEi5Trz" # laptop
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINeXccmMQ9jfLG2Z8CITaZZ+pUgYVNVYDFtmdkBHd3xk" # phone
  ];
in
{
  age.secrets.q-password.file = ../../secrets/q-pass.age;

  users.users.q = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    hashedPasswordFile = config.age.secrets.q-password.path;
    openssh.authorizedKeys.keys = ssh-keys;
  };
}
