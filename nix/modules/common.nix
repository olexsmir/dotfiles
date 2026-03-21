{ pkgs, ... }: {
  age.identityPaths = [ "/keys.txt" ];

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    optimise.automatic = true;
    settings = {
      auto-optimise-store = true;
      trusted-users = [ "root" "olex" "q" ];
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
