{ config, ... }: {
  services.caddy.virtualHosts."music.olexsmir.xyz".extraConfig = ''
    reverse_proxy localhost:4533
  '';

  services.navidrome = {
    enable = true;
    settings = {
      MusicFolder = "/mnt/music";
    };
  };

  # services.slskd= {
  #   enable = true;
  #
  # };
}
