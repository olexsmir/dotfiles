{ pkgs, ... }:
let
  configFile = "/var/lib/mugit/config.yaml";
  mugitSrc = builtins.fetchGit {
    url = "https://github.com/olexsmir/mugit.git";
    ref = "main";
  };
  buildScript = pkgs.writeShellScript "build-mugit" ''
    set -e

    BUILD_DIR="/tmp/mugit-build-$$"

    export GOCACHE="$BUILD_DIR/.cache"
    export GOPATH="$BUILD_DIR/.go"
    export HOME="$BUILD_DIR"

    mkdir -p "$BUILD_DIR"

    cp -r ${mugitSrc}/* "$BUILD_DIR/"
    chmod -R u+w "$BUILD_DIR"

    cd "$BUILD_DIR"
    ${pkgs.go}/bin/go build -o /var/lib/mugit/mugit .
    chmod -R u+w "$BUILD_DIR" 2>/dev/null || true
    rm -rf "$BUILD_DIR"
  '';
in
{
  services.caddy.virtualHosts."git.olexsmir.xyz".extraConfig = ''
    reverse_proxy localhost:8008
  '';

  systemd.tmpfiles.rules = [ "d /var/lib/mugit 0755 git git -" ];

  systemd.services.mugit = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    path = [
      pkgs.git
      pkgs.go
      pkgs.gcc
    ];
    serviceConfig = {
      Type = "simple";
      User = "git";
      WorkingDirectory = "/var/lib/mugit";
      Restart = "on-failure";
      RestartSec = 2;
      ExecStartPre = "${buildScript}";
      ExecStart = "/var/lib/mugit/mugit --config ${configFile} serve";
      ReadOnlyPaths = [ configFile ];
      NoNewPrivileges = true;
      ReadWritePaths = [ "/var/lib/mugit" ];
      AmbientCapabilities = [ "CAP_NET_BIND_SERVICE" ];
      CapabilityBoundingSet = [ "CAP_NET_BIND_SERVICE" ];
      TimeoutStartSec = "5min";
      ProtectHome = true;
    };
  };
}
