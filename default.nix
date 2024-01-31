{pkgs ? import <nixpkgs> {} }: with pkgs; stdenvNoCC.mkDerivation rec {
  pname = "gruvbox-material-gtk";
  version = "0.0.1";
  propagatedUserEnvPkgs = [ gtk-engine-murrine ];
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
  meta = with lib; {
    description = "Gruvbox Material for GTK, Gnome, Cinnamon, XFCE, Unity, Plank and Icons";
    homepage = "https://github.com/TheGreatMcPain/gruvbox-material-gtk";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
