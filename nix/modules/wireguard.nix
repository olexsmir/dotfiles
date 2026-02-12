{ config, pkgs, ... }:
{

  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;

  networking.nat = {
    enable = true;
    externalInterface = "ens3";
    internalInterfaces = [ "wg0" ];
  };

  age.secrets.wg-private-key.file = ../secrets/wg-private-key.age;

  networking.firewall.allowedUDPPorts = [ 51820 ];
  networking.wireguard.interfaces.wg0 = {
    ips = [ "10.100.0.1/24" ];
    listenPort = 51820;
    privateKeyFile = config.age.secrets.wg-private-key.path;

    postSetup = ''${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o ens3 -j MASQUERADE'';
    postShutdown = ''${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o ens3 -j MASQUERADE'';

    peers = [
      {
        publicKey = "cF0abpqZiMrofQUgFHS4D+FuXq3ZoCPBQUlr6WuvBwM="; # laptop
        allowedIPs = [ "10.100.0.2/32" ];
      }
      {
        publicKey = "GodHMXUBh/0aEyz+XBJID7pm/Hi8xnZv6YzkQbl/Uwc="; # phone
        allowedIPs = [ "10.100.0.3/32" ];
      }
    ];
  };
}
