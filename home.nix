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
      lsd

      gnumake
      cmake
      ninja
      bear
      lld

      uv

      nixfmt

      helix

      discord
    ];
  };

  # targets.darwin.copyApps.enable = false;

  # targets.darwin.linkApps = {
  #   enable = true;
  #   directory = "Applications";
  # };

  programs = import ./programs { inherit pkgs; };
}
