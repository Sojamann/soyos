{
  description = "My Home Manager Setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix/release-24.11";
  };

  outputs = { nixpkgs, home-manager, stylix, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      home = {
        username,
        extra-packages ? [],
      }:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/default.nix stylix.homeManagerModules.stylix ];
          extraSpecialArgs = {
            inherit username;
            inherit extra-packages;
            inherit stylix;
          };
        };
    in {
        homeConfigurations."home" = home {
          username = "robin";
          extra-packages = with pkgs; [
              odin
          ];
        };
        homeConfigurations."work" = home {
          username = "bergewsk";
          extra-packages = with pkgs; [
              kubectl
              kubernetes-helm
          ];
        };
    };
}
