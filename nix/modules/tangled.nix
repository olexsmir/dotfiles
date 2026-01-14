{ ... }:
{
  services.caddy.virtualHosts."knot.olexsmir.xyz".extraConfig = ''
    reverse_proxy localhost:5555
  '';

  services.tangled.knot = {
    enable = true;
    openFirewall = false;
    motd = "i use arch btw\n";
    server = {
      owner = "did:plc:slhnamqkslwa5e5e5hrznbxr";
      hostname = "knot.olexsmir.xyz";
    };
  };
}
