{ ... }:
{
  imports = [
    ./digitalocean.nix
    ./configuration.nix
    ./hardware-configuration.nix

    ../../users/q.nix

    ../../modules/freshrss.nix
    ../../modules/tangled.nix
    ../../modules/moviefeed.nix
    ../../modules/wireguard.nix
    ../../modules/soju.nix
  ];
}
