{ ... }: {
  services.caddy.virtualHosts."s.olexsmir.xyz".extraConfig = ''
    map {path} {redirect-uri} {
      import /redirects.caddy
    }
    redir {redirect-uri}
  '';
}
