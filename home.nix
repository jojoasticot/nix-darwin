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

      clang
      lld

      uv
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
