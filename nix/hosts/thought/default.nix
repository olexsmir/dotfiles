{ ... }: {
  imports = [
    ./digitalocean.nix
    ./configuration.nix
    ./hardware-configuration.nix

    ../../modules/common.nix
    ../../modules/users/q.nix
    ../../modules/services/freshrss.nix
    ../../modules/services/mugit.nix
    ../../modules/services/wireguard.nix
    ../../modules/services/moviefeed.nix
  ];
}
