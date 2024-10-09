{
  description = "My Home Manager Setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:nix-community/nixGL";
  };

  outputs = { nixpkgs, home-manager, nixgl, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      home = {
        user-config,
        extra-packages ? [],
      }:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/default.nix ];
          extraSpecialArgs = {
            inherit nixgl;
            inherit user-config;
            inherit extra-packages;
          };
        };
      };
}
