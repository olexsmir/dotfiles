{ config, ... }:
let mkSec = file: { inherit file; owner = "mugit"; group = "mugit"; };
in {
  age.secrets.github-token = mkSec ../../secrets/github-token.age;
  age.secrets.mugit-host   = mkSec ../../secrets/mugit-host.age;

  networking.firewall.allowedTCPPorts = [ 22 ];
  services.caddy.virtualHosts."git.olexsmir.xyz".extraConfig = ''
    reverse_proxy localhost:8008
  '';

  services.mugit = {
    enable = true;
    exposeCli = true;
    config = {
      server.port = 8008;
      repo.dir = "/var/lib/mugit/";
      meta = {
        description = "hey kid, come get your free software";
        title = "git.olexsmir.xyz";
        host = "git.olexsmir.xyz";
      };
      ssh = {
        enable = true;
        port = 22;
        host_key = config.age.secrets.mugit-host.path;
        keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPLLJdkVYKZgsayw+sHanKPKZbI0RMS2CakqBCEi5Trz"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMPQ0Qz0DFB+rGrD8ScUqbUTZ1/O8FHrOBF5bIAGQgMj"
        ];
      };
      mirror = {
        enable = true;
        interval = "6h";
        github_token = "$file:" + config.age.secrets.github-token.path;
      };
    };
  };
}
