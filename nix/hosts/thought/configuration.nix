{ pkgs, ... }: {
  imports = [
    ./disko-config.nix
    ./hardware-configuration.nix
  ];

  system.stateVersion = "26.05";

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
    # No device install: Azure VHD boots via the EFI-removable path (BOOTX64.EFI).
    device = "nodev";
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
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    git
    htop
    neovim
  ];
}
