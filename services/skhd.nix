{
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
}
