{ pkgs, ... }:
{
  imports = [
    ./disko-config.nix
    ./hardware-configuration.nix
  ];

  system.stateVersion = "24.05";

  swapDevices = [
    {
      device = "/swapfile";
      size = 2048; # MB
    }
  ];

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  time.timeZone = "Europe/Kyiv";
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "vps";
    useDHCP = true;
    # Interface names will be auto-detected in hardware-configuration.nix
    # Using generic DHCP setting
    interfaces = { };
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
        2222
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    neovim
    git
    htop
    tmux
  ];

  age.identityPaths = [ "/keys.txt" ]; # TODO: i dont like that i overwrites literally everything

  services = {
    caddy = {
      enable = true;
      package = pkgs.caddy.withPlugins {
        plugins = [ "github.com/mholt/caddy-l4@v0.0.0-20260116154418-93f52b6a03ba" ];
        hash = "sha256-s8D9p8k/Gote8s4fk0pv35R7aIwRi5ze7gbBHj+Fm8U=";
      };
    };
    openssh = {
      enable = true;
      ports = [ 2222 ];
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
