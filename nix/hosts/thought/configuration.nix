{ pkgs, ... }:
{
  imports = [
    ./disko-config.nix
    ./hardware-configuration.nix
  ];

  system.stateVersion = "25.11";

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
    interfaces = { };
    firewall = {
      enable = true;
      allowedTCPPorts = [
        80
        443
        2222
      ];
    };
  };

  age.identityPaths = [ "/keys.txt" ];

  services = {
    caddy.enable = true;
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

  environment.systemPackages = with pkgs; [
    neovim
    git
    htop
  ];
}
