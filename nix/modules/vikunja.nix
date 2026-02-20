{ ... }:
{
  services.caddy.virtualHosts."vikunja.olexsmir.xyz".extraConfig = ''
    reverse_proxy localhost:3456
  '';

  services.vikunja = {
    enable = true;
    frontendScheme = "https";
    frontendHostname = "vikunja.olexsmir.xyz";
    settings = {
      service = {
        enableregistration = true;
      };
    };
  };
}
