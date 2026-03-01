{ config, pkgs, ... }:
let
  peers = [
    { name = "laptop"; key = "cF0abpqZiMrofQUgFHS4D+FuXq3ZoCPBQUlr6WuvBwM="; ip = "10.100.0.2"; }
    { name = "phone";  key = "GodHMXUBh/0aEyz+XBJID7pm/Hi8xnZv6YzkQbl/Uwc="; ip = "10.100.0.3"; }
  ];
in {
  age.secrets.wg-key.file = ../../secrets/wg-key.age;

  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  networking = {
    nat = {
      enable = true;
      externalInterface = "ens3";
      internalInterfaces = [ "wg0" ];
    };
    firewall.allowedUDPPorts = [ 51820 ];
    wireguard.interfaces."wg0" = {
      ips = [ "10.100.0.1/24" ];
      listenPort = 51820;
      privateKeyFile = config.age.secrets.wg-key.path;
      postSetup = ''${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o ens3 -j MASQUERADE'';
      postShutdown = ''${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o ens3 -j MASQUERADE'';
      peers = map(p: {
        publicKey = p.key;
        allowedIPs = [ "${p.ip}/32" ];
      }) peers;
    };
  };
}
