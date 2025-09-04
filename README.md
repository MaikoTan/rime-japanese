# rime-japanese

Nix package to install [`rime-japanese`](https://github.com/gkovacs/rime-japanese), Japanese input method for rime.

> [!WARNING]
> This package is deprecated, you can use [`rime-japanese`](https://search.nixos.org/packages?channel=unstable&show=rime-japanese&query=rime-japanese) from official `nixpkgs`.

------

> [!NOTE]
> If you are interested in the AUR package, please refer to the [`aur` branch](https://github.com/MaikoTan/rime-japanese/tree/aur/).

## Install

### Flakes

Add this repository to your `flake.nix`:

```nix
{
  inputs.rime-japanese.url = "github:MaikoTan/rime-japanese#nix";
  inputs.rime-japanese.inputs.nixpkgs.follows = "nixpkgs";
  # ...
}
```

Then install the package (from home manager):

```nix
{
  home.packages = with pkgs; [
    rime-japanese
  ];
}
```

## License

[LGPL-3.0](./LICENSE)

