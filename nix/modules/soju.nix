{ ... }:
let
  domain = "irc.olexsmir.xyz";
in
{
  networking.firewall.allowedTCPPorts = [ 6697 ];
  services.caddy = {
    virtualHosts.${domain}.extraConfig = ''
      respond "irc bouncer"
    '';
    globalConfig = ''
      layer4 {
        :6697 {
          route {
            tls {
              connection_policy {
                alpn http/1.1 http/1.0 irc
                default_sni ${domain}
              }
            }
            proxy {
              proxy_protocol v2
              upstream localhost:6667
            }
          }
        }
      }
    '';
  };

  services.soju = {
    enable = true;
    hostName = domain;
    listen = [ "irc+insecure://localhost:6667" ];
    acceptProxyIP = [ "localhost" ];
  };
}
