self: super: {
  dbeaver-with-vrapper = super.dbeaver-bin.overrideAttrs (oldAttrs: {
    postInstall = ''
      # Vrapper (main plugin)
      ln -s ${self.fetchzip {
        url = "https://downloads.sourceforge.net/project/vrapper/vrapper/0.74.0/vrapper_0.74.0_20181124.zip";
        sha256 = "19lrxys18k0fr5l2gb2d66jf88vlfwbrf05mnq9a4m925631k0mb";
      }} $out/share/dbeaver/plugins/vrapper
    '';
  });
}
