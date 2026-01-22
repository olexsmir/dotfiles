{ pkgs, ... }:
let
  configFile = "/var/lib/mugit/config.yaml";
  version = "a49f890";
  mugit = pkgs.buildGoModule {
    pname = "mugit";
    inherit version;
    vendorHash = "sha256-FJuWIYvuidIJOSrihYbaimclrd+dfmWx10Fs6HqtYsI=";
    src = pkgs.fetchFromGitHub {
      owner = "olexsmir";
      repo = "mugit";
      rev = version;
      hash = "sha256-aaCTH6LN/LdYe2QWQeKWO+AKiU5uJEOHQGm0Utpa+uc=";
    };
  };
in
{
  services.caddy.virtualHosts."git.olexsmir.xyz".extraConfig = ''
    reverse_proxy localhost:8008
  '';

  systemd.services.mugit = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    serviceConfig = {
      Type = "simple";
      User = "git";
      Restart = "on-failure";
      RestartSec = 2;
      ExecStart = "${mugit}/bin/mugit --config ${configFile} serve";
      path = [ pkgs.git ];
      NoNewPrivileges = true;
      ProtectSystem = "strict";
      ReadOnlyPaths = [ configFile ];
      ReadWritePaths = [ "/var/lib/mugit" ];
      AmbientCapabilities = [ "CAP_NET_BIND_SERVICE" ]; # Allow binding to port 22
      ProtectHome = true;
    };
  };
}
