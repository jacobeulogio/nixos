{
  config,
  pkgs,
  ...
}: {
  users.defaultUserShell = pkgs.zsh;

  environment.localBinInPath = true;

  hardware.keyboard.qmk.enable = true;


  fonts = {
    fontDir.enable = true;
    fontconfig.enable = true;
  };
}
