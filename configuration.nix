{
  self,
  pkgs,
  lib,
  ...
}:
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
      ls = "lsd";
      l = "ls -al";
      tree = "lsd --tree";
      gt = "git tag -ma ";
      gpt = "git push --follow-tags";
      gitlo = "git log --graph --oneline --all";
      c = "clear";
      drs = "sudo darwin-rebuild switch --flake ~/.config/nix-darwin#MacBook-Air-de-Johan";
      drb = "darwin-rebuild build --flake ~/.config/nix-darwin#MacBook-Air-de-Johan";
    };

  };

  documentation = {
    enable = true;
    doc.enable = true;
    info.enable = true;
    man.enable = true;
  };

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "discord"
    ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  system.primaryUser = "johanemmanuelli";

  system.defaults.dock = {
    autohide = true;
    autohide-delay = 0.0;
    autohide-time-modifier = 0.25;
    expose-animation-duration = 0.0;

    tilesize = 28;
    magnification = true;
    largesize = 60;
    orientation = "left";

    persistent-apps = [
      { app = "/Applications/Visual Studio Code.app"; }
      { app = "/Applications/Zen.app"; }
      { app = "${pkgs.ghostty-bin}/Applications/Ghostty.app"; }
      { app = "${pkgs.discord}/Applications/Discord.app"; }
    ];

    show-recents = false;
    static-only = false;
  };

  system.defaults.NSGlobalDomain = {
    InitialKeyRepeat = 15;
    KeyRepeat = 2;
    ApplePressAndHoldEnabled = false;
    NSAutomaticCapitalizationEnabled = false;
  };

  security.pam.services.sudo_local = {
    enable = true;
    reattach = true;
    touchIdAuth = true;
  };

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Disable Nix installation for nix-darwin
  nix.enable = false;

  services = import ./services;

  homebrew = {
    enable = true;

    brews = [
      "clang-format" # sadly we cant install with clang-tools package bc clangd is broken
    ];

    casks = [
      "jurplel/tap/instant-space-switcher"
      "deezer"
      "docker-desktop"
      "gimp"
      "iina"
      "nvidia-nsight-compute"
      "nvidia-nsight-systems"
      "macfuse" # needed to connect to the afs
      "utm"
      "visual-studio-code"
      "vorssaint"
      "zen"
    ];

    onActivation = {
      cleanup = "uninstall";
    };
  };
}
