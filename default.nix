{pkgs ? import <nixpkgs> {},...}: with pkgs; stdenv.mkDerivation rec {
  name = "gruvbox-material-gtk";
  buildInputs = [ gtk-engine-murrine ];
  src = fetchFromGitHub {
    owner = "TheGreatMcPain";
    repo = "gruvbox-material-gtk";
    rev = "a1295d8bcd4dfbd0cd6793d7b1583b442438ed89";
    hash = "sha256-VumO8F4ZrFI6GZU1XXaw4MCnP+Nla1rVS3uuSUzpl9E=";
  };
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/themes
    cp -r themes/* $out/share/themes
    mkdir -p $out/share/icons
    cp -r icons/* $out/share/icons
    runHook postInstall
  '';
}
