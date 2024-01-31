{
  description = "nix flake for gruvbox-material-gtk";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system;};
  in {

    packages.x86_64-linux.gruvbox-material-gtk = pkgs.callPackage ./default.nix { inherit pkgs; };

    packages.x86_64-linux.default = self.packages.x86_64-linux.gruvbox-material-gtk;

  };
}
