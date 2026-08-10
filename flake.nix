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
			qemu = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./hosts/vm/qemu/hardware-configuration.nix
					./hosts/vm/qemu/configuration.nix

					# Integrates Home Manager into NixOS
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;

						# Imports user home.nix
						home-manager.users.kattus = import ./home/home.nix;
					}
				];
			};
		};
	};
}
