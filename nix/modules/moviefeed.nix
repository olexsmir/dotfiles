{ pkgs, ... }:
let
  configFile = "/home/q/moviedfeed.yml";
  version = "2bda86db";
  moviefeed = pkgs.buildGoModule {
    pname = "moviefeed";
    inherit version;
    vendorHash = "sha256-FWkYhhX/cZhF+ctgbYPhPRYcQZSLIL3zoaxqrbWZCcU=";
    src = pkgs.fetchFromGitHub {
      owner = "olexsmir";
      repo = "moviefeed";
      rev = version;
      hash = "sha256-g05iqKH3g6Q536AF3Xb2zYx3jiLXybaavM7UB9Hu5Dg=";
    };
  };
in
{
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
