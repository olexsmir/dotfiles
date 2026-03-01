{ pkgs, ... }:
let
  configFile = "/home/q/moviedfeed.yml";
  moviefeed = pkgs.buildGoModule {
    pname = "moviefeed";
    version = "lol";
    vendorHash = "sha256-FWkYhhX/cZhF+ctgbYPhPRYcQZSLIL3zoaxqrbWZCcU=";
    src = pkgs.fetchFromGitHub {
      owner = "olexsmir";
      repo = "moviefeed";
      rev = "1875224";
      hash = "sha256-rmFLFbVQ4P2LdezM6ZGS+DI9NY4VMpXrp1p1QjB9FO0=";
    };
  };
in {
  services.caddy.virtualHosts."moviefeed.olexsmir.xyz".extraConfig = ''
    reverse_proxy localhost:8000
  '';

  systemd.services.moviefeed = {
    description = "moviefeed API server";
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    serviceConfig = {
      Type = "simple";
      User = "q";
      Restart = "on-failure";
      RestartSec = 2;
      ExecStart = "${moviefeed}/bin/moviefeed --config ${configFile}";
      NoNewPrivileges = true;
      ProtectSystem = "strict";
      ReadOnlyPaths = [ configFile ];
    };
  };
}
