{
  description = "Japanese input method for rime";

  inputs.rime-japanese = {
    url = "github:gkovacs/rime-japanese";
    flake = false;
  };
  outputs = { self, nixpkgs, rime-japanese }:
  {
    packages.x86_64-linux.default = with nixpkgs.legacyPackages.x86_64-linux; stdenv.mkDerivation {
      name = "rime-japanese";
      version = "0.0.1";

      nativeBuildInputs = [ pkgs.librime ];

      buildPhase = ''
        for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
      '';

      installPhase = ''
        mkdir -p $out/share/rime-data/build
        ln -sv ${rime-japanese}/*.yaml $out/share/rime-data/build/
        ln -sv ${rime-japanese}/build/* $out/share/rime-data/build/build
      '';
    };
  };
}
