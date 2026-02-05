{
  description = "my nix";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tangled = {
      url = "git+https://tangled.org/@tangled.org/core?ref=refs/tags/v1.11.0-alpha";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mugit = {
      url = "github:olexsmir/mugit";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      agenix,
      disko,
      tangled,
      mugit,
      ...
    }:
    {
      nixosConfigurations."thought" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/thought
          agenix.nixosModules.default
          disko.nixosModules.disko
          tangled.nixosModules.knot
          tangled.nixosModules.spindle
          mugit.nixosModules.default
        ];
      };
    };
}
