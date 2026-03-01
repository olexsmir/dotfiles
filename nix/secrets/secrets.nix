let
  laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPLLJdkVYKZgsayw+sHanKPKZbI0RMS2CakqBCEi5Trz";
  infra = "age1k4e6mm0whyjzfaqlhahu2pst4vxvzul53xs3ff0tk8uty459zgzqk3965k";
  allKeys = [ laptop infra ];
in
{
  "q-pass.age".publicKeys = allKeys;
  "freshrss-olex.age".publicKeys = allKeys;
  "wg-key.age".publicKeys = allKeys;
  "github-token.age".publicKeys = allKeys;
  "mugit-host.age".publicKeys = allKeys;
}
