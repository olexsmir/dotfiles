{ ... }: {
  imports = [
    ./disko-config.nix
    ./hardware-configuration.nix
  ];

  system.stateVersion = "25.11";

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  swapDevices = [ {
   device = "/swapfile";
    size = 2048; # MB
  } ];

  time.timeZone = "Europe/Kyiv";
  i18n.defaultLocale = "en_US.UTF-8";
  networking = {
    hostName = "thought";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 2222 ];
    };
  };

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
}
