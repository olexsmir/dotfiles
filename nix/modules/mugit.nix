{ ... }:
{
  services.caddy.virtualHosts."git.olexsmir.xyz".extraConfig = ''
    reverse_proxy localhost:8008
  '';

  services.mugit = {
    enable = true;
    openFirewall = true;
    config = {
      server.port = 8008;
      meta = {
        description = "hey kid, come get your free software";
        title = "git.olexsmir.xyz";
        host = "git.olexsmir.xyz";
      };
      ssh = {
        enable = true;
        port = 22;
        host_key = "/var/lib/mugit/mugit-key";
        keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPLLJdkVYKZgsayw+sHanKPKZbI0RMS2CakqBCEi5Trz"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMPQ0Qz0DFB+rGrD8ScUqbUTZ1/O8FHrOBF5bIAGQgMj"
        ];
      };
      repo = {
        dir = "/var/lib/mugit/";
        readmes = [
          "README.md"
          "readme"
          "readme.txt"
        ];
        masters = [
          "master"
          "main"
        ];
      };
      mirror = {
        enable = true;
        interval = "8h";
      };
    };
  };
}
