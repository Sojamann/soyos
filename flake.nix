{
  description = "My Home Manager Setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      home = { user-config, extra-packages, }:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./common/default.nix ];
          extraSpecialArgs = { 
            inherit user-config;
            inherit extra-packages;
          };
        };
      };
}
