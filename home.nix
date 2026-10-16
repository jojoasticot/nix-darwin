{ config, pkgs, ... }:
{
  home = {
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    username = "johanemmanuelli";
    homeDirectory = "/Users/johanemmanuelli";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "26.05";

    packages = with pkgs; [
      git
      lsd

      gnumake
      cmake
      ninja
      bear

      clang
      lld

      uv

      nixfmt

      helix
    ];
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "Johan Emmanuelli";
        email = "johan.emmanuelli2004@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };

  programs.aerospace = {
    enable = true;
    launchd.enable = true;
    
    settings = {
      mode.main.binding = {
        "alt-h" = "focus left";
        "alt-j" = "focus down";
        "alt-k" = "focus up";
        "alt-l" = "focus right";
    
        "alt-shift-h" = "move left";
        "alt-shift-j" = "move down";
        "alt-shift-k" = "move up";
        "alt-shift-l" = "move right";
    
        "alt-1" = "workspace 1";
        "alt-2" = "workspace 2";
        "alt-3" = "workspace 3";
        "alt-4" = "workspace 4";
        "alt-5" = "workspace 5";
        "alt-6" = "workspace 6";
        "alt-7" = "workspace 7";
    
        "alt-shift-1" = "move-node-to-workspace 1";
        "alt-shift-2" = "move-node-to-workspace 2";
        "alt-shift-3" = "move-node-to-workspace 3";
        "alt-shift-4" = "move-node-to-workspace 4";
        "alt-shift-5" = "move-node-to-workspace 5";
        "alt-shift-6" = "move-node-to-workspace 6";
        "alt-shift-7" = "move-node-to-workspace 7";
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
