{ ... }: {
  imports = [
    ./configuration.nix

    ../../modules/common.nix
    ../../modules/users/q.nix
    ../../modules/services/freshrss.nix
    ../../modules/services/mugit.nix
    ../../modules/services/wireguard.nix
    ../../modules/services/rss-tools.nix
    ../../modules/services/music.nix
  ];
}
