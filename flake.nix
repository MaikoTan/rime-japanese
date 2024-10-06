{
  description = "Japanese input method for rime";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.rime-japanese = {
    url = "github:gkovacs/rime-japanese";
    flake = false;
  };
  outputs = { self, nixpkgs, flake-utils, rime-japanese }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.default = pkgs.stdenv.mkDerivation {
        name = "rime-japanese";

        src = pkgs.fetchFromGitHub {
          owner = "gkovacs";
          repo = "rime-japanese";
          rev = "master";
          sha256 = "sha256-/mIIyCu8V95ArKo/vIS3qAiD8InUmk8fAF/wejxRxGw=";
        };

        nativeBuildInputs = with pkgs; [ librime rime-data ];

        buildPhase = ''
          for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s . ${pkgs.rime-data}/share/rime-data/ .; done
        '';

        installPhase = ''
          mkdir -p $out/share/rime-data/build
          cp -v ${rime-japanese}/*.yaml $out/share/rime-data/
          cp -v ${rime-japanese}/build/* $out/share/rime-data/build/
        '';
      };
    }
  );
}
