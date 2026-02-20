{ ... }:
{
  imports = [
    ./digitalocean.nix
    ./configuration.nix
    ./hardware-configuration.nix

    ../../users/q.nix

    ../../modules/freshrss.nix
    ../../modules/moviefeed.nix
    ../../modules/mugit.nix
    ../../modules/wireguard.nix
    ../../modules/shortener.nix
    ../../modules/vikunja.nix
  ];
}
