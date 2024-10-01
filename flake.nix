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
      user-config = import ./user-config.nix;
    in {
      home = { first-name, last-name, email, username }:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ 
            ./common/default.nix
            ./systems/tower.nix
          ];
          extraSpecialArgs = { inherit user-config; };
        };
      };
    };
  };
}
