# NomaDamas Homebrew tap

## fsearch-mac

FSearch fork for macOS: FSEvents live monitoring + headless `fsearch-cli` (index / watch daemon / search). GPL-2.0-or-later. Fork of [cboxdoerfer/fsearch](https://github.com/cboxdoerfer/fsearch).

```sh
brew tap NomaDamas/fsearch-mac
brew install fsearch-mac
```

Installs `fsearch-cli` and the `fsearch` GUI. Quick start:

```sh
fsearch-cli index --db ~/fs.db --include / --one-file-system --dev-excludes
fsearch-cli watch --db ~/fs.db &
fsearch-cli search --db ~/fs.db report
```

Docs: https://github.com/NomaDamas/fsearch-mac
