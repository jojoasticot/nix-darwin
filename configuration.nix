{ self, pkgs, ... }:
{
  users.users.johanemmanuelli = {
    name = "johanemmanuelli";
    home = "/Users/johanemmanuelli";
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment = {
    systemPackages = with pkgs; [
      git
      vim
      curl
      wget
    ];

    shellAliases = {
      ls        = "lsd";
      l         = "ls -al";
      tree      = "lsd --tree";
      hexedit   = "hexedit --color";
      gt        = "git tag -ma ";
      gpt       = "git push --follow-tags";
      gitlo     = "git log --graph --oneline --all";
      c         = "clear";
      clang     = "clang -fcolor-diagnostics";
      "clang++" = "clang++ -fcolor-diagnostics";
      drs       = "sudo darwin-rebuild switch --flake ~/.config/nix-darwin#MacBook-Air-de-Johan";
      drb       = "darwin-rebuild build --flake ~/.config/nix-darwin#MacBook-Air-de-Johan";
    };

  };

  documentation = {
    enable = true;
    doc.enable = true;
    info.enable = true;
    man.enable = true;
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  security.pam.services.sudo_local = {
    enable = true;
    reattach = true;
    touchIdAuth = true;
  };

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Disable Nix installation for nix-darwin
  nix.enable = false;
}
