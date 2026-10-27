{
  git = import ./git.nix;
  # vim = import ./vim.nix;

  # Let Home Manager install and manage itself.
  home-manager.enable = true;
}
