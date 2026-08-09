{ pkgs, ...}:

{
	home.username = "kattus";
	home.homeDirectory = "/home/kattus";

	# User packages
	home.packages = with pkgs; [
		fastfetch
		btop
		vim
	];

	# Programs special configurations
	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config/#kattus-nixos";
		};
	};

	home.stateVersion = "26.05";
	programs.home-manager.enable = true;
}
