{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    mugit.url = "github:olexsmir/mugit";
    mugit.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { nixpkgs, agenix, disko, ... } @ inputs: {
    nixosConfigurations."thought" = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/thought
        agenix.nixosModules.default
        disko.nixosModules.disko
        inputs.mugit.nixosModules.default
        { nixpkgs.hostPlatform = "x86_64-linux"; }
      ];
    };
  };
}
