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

  services.yabai = {
    enable = true;

    config = {
      layout = "bsp";
      mouse_follows_focus = "off";
      window_placement = "second_child";
      top_padding = 0;
      bottom_padding = 0;
      left_padding = 0;
      right_padding = 0;
      window_gap = 5;
    };
  };

  services.skhd = {
    enable = true;

    skhdConfig = ''
      # open terminal
      cmd - return : open -n -a "Ghostty"

      # moves focus between windows in the current focused display
      alt - h : yabai -m window --focus west
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - l : yabai -m window --focus east

      # move windows
      shift + alt - h : yabai -m window --warp west
      shift + alt - j : yabai -m window --warp south
      shift + alt - k : yabai -m window --warp north
      shift + alt - l : yabai -m window --warp east

      # send window to a space
      shift + alt - 1 : yabai -m window --space 1
      shift + alt - 2 : yabai -m window --space 2
      shift + alt - 3 : yabai -m window --space 3
      shift + alt - 4 : yabai -m window --space 4
      shift + alt - 5 : yabai -m window --space 5
      shift + alt - 6 : yabai -m window --space 6
      shift + alt - 7 : yabai -m window --space 7
      shift + alt - 8 : yabai -m window --space 8
      shift + alt - 9 : yabai -m window --space 9
    '';
  };

  homebrew = {
    enable = true;

    brews = [
      "clang-format" # sadly we cant install with clang-tools package bc clangd is broken
    ];

    casks = [
      "jurplel/tap/instant-space-switcher"
      "deezer"
      "discord"
      "docker-desktop"
      "ghostty"
      "gimp"
      "iina"
      "nvidia-nsight-compute"
      "nvidia-nsight-systems"
      # "spacetile/tap/spacetile"
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
