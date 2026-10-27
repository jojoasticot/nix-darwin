{
  enable = true;

  settings = {
    user = {
      name = "Johan Emmanuelli";
      email = "johan.emmanuelli2004@gmail.com";
    };

    init = {
      defaultBranch = "main";
    };

    core = {
      editor = "vim";
    };
  };

  lfs.enable = true;

  ignores = [
    "*~"
    "*.swp"
    ".DS_Store"
  ];
}
