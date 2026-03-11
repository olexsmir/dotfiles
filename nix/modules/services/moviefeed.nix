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
      rev = "d1fd0edc3de3384f8f4e06e5a0813a311a9ce13d";
      hash = "sha256-KYSAeb4hA60aL2XjuwwTN13dJgvbove+jESNyU5wrKM=";
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
