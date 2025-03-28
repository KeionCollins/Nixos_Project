{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, nvf,... }@inputs: {

    packages."x86_64-linux".default = 
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
	modules = [ ./modules/nvf/default.nix ];
      }).neovim;

    nixosConfigurations.baal = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [
        ./hosts/Baal/configuration.nix
	inputs.home-manager.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobal.Pkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.username = import ./modules/core/default.nix;
        }
      ];
    };
  };
}
