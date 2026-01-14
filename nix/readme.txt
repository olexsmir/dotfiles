nix
---

install:
  nix run github:nix-community/nixos-anywhere -- ./hosts/thought/hardware-configuration.nix --flake .#thought --target-host root@<IP>
  ssh q@IP
  git clone https://github.com/olexsmir/dotfiles.git
  cd dotfiles/nix
  sudo nixos-rebuild switch --flake .#thought
