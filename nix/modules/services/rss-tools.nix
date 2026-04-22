{ ... }: {
  services.caddy.virtualHosts."rsst.olexsmir.xyz".extraConfig = ''
    reverse_proxy localhost:6767
  '';

  services.rss-tools = {
    enable = true;
    settingsFile = "/var/lib/rss-tools/config.json";
    dbPath = "/var/lib/rss-tools/db";
  };
}
