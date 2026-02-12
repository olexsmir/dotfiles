{ config, ... }:
{
  services.caddy.virtualHosts."git.olexsmir.xyz".extraConfig = ''
    reverse_proxy localhost:8008
  '';

  age.secrets.github_token = {
    file = ../secrets/github_token.age;
    owner = "mugit";
    group = "mugit";
  };

  age.secrets.mugit_host = {
    file = ../secrets/mugit_host.age;
    owner = "mugit";
    group = "mugit";
  };

  services.mugit = {
    enable = true;
    openFirewall = true;
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
        host_key = config.age.secrets.mugit_host.path;
        keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPLLJdkVYKZgsayw+sHanKPKZbI0RMS2CakqBCEi5Trz"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMPQ0Qz0DFB+rGrD8ScUqbUTZ1/O8FHrOBF5bIAGQgMj"
        ];
      };
      mirror = {
        enable = true;
        interval = "6h";
        github_token = "$file:" + config.age.secrets.github_token.path;
      };
    };
  };
}
