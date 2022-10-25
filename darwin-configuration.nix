{ config, pkgs, ... }:

{
	# List packages installed in system profile. To search by name, run:
	# $ nix-env -qaP | grep wget
	environment.systemPackages = with pkgs; [
		# firefox
		helix
		git
		neovim

		nodejs

		vscode
		slack
		# google-chrome
	];

	nixpkgs.config.allowUnfree = true; # for vscode
	# Use a custom configuration.nix location.
	# $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
	# environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

	# Auto upgrade nix package and the daemon service.
	services.nix-daemon.enable = true;
	# nix.package = pkgs.nix;

	# Create /etc/zshrc that loads the nix-darwin environment.
	programs.zsh.enable = true;  # default shell on catalina
	# programs.fish.enable = true;

	homebrew = {
		enable = true;
		casks = [ "google-chrome" "firefox" ];
	};

	users.users = {
		rbozan = {
			description = "Robin Bozan";
			createHome = true;
			isHidden = false;
		};
	};


	system.defaults = {
		loginwindow.GuestEnabled = true;
		dock.orientation = "left";
#		NSGlobalDomain.com.apple.swipescrolldirection = false;
	};

	# Used for backwards compatibility, please read the changelog before changing.
	# $ darwin-rebuild changelog
	system.stateVersion = 4;
}
