{ pkgs, ... }:
{
  git = import ./git.nix;
  # vim = import ./vim.nix;
  ghostty = import ./ghostty.nix { inherit pkgs ;} ;

  # Let Home Manager install and manage itself.
  home-manager.enable = true;
}
