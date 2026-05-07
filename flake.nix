{
  description = "ahmedtroudi's home-manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      mkHome = { system, username, homeDirectory }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          modules = [
            ./home.nix
            {
              home = {
                inherit username homeDirectory;
                stateVersion = "25.11";
              };
            }
          ];
        };
    in {
      homeConfigurations = {
        "ahmedtroudi@mac" = mkHome {
          system = "aarch64-darwin";
          username = "ahmedtroudi";
          homeDirectory = "/Users/ahmedtroudi";
        };
        # "ahmedtroudi@linux" = mkHome {
        #   system = "x86_64-linux";
        #   username = "ahmedtroudi";
        #   homeDirectory = "/home/ahmedtroudi";
        # };
      };
    };
}
