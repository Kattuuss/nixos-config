{
	description = "NixOS Flake configuration with Home Manager";
	
	inputs = {
		# Unstable branch
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs: {
		nixosConfigurations = {
			kattus-nixos = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./hardware-configuration.nix
					./configuration.nix

					# Integrates Home Manager into NixOS
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;

						# Imports user home.nix
						home-manager.users.kattus = import ./home.nix;
					}
				];
			};
		};
	};
}
