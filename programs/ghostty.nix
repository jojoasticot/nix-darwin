{ pkgs, ... }:
{
  enable = true;
  package = if pkgs.stdenv.hostPlatform.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;
  enableZshIntegration = true;
  
  settings = {
    font-size = 16;
    theme = "Rose Pine Moon";
    background-opacity = 0.8;

    keybind = [
      "ctrl+h=goto_split:left"
      "ctrl+j=goto_split:down"
      "ctrl+k=goto_split:up"
      "ctrl+l=goto_split:right"

      "ctrl+enter=new_split:right"
      "ctrl+shift+enter=new_split:down"
      # "alt+shift+q=close_surface"
    ];
  };
}
