# Homebrew tap

Six small Mac apps, installable with Homebrew.

```bash
brew tap brijraj-rana/tap
brew trust brijraj-rana/tap        # recent Homebrew asks you to trust a third-party tap before using it
brew install --cask launchcheck
```

| Cask | What it is |
|---|---|
| [`launchcheck`](https://github.com/brijraj-rana/launchcheck) | Checks a website for SEO mistakes before it goes live. Also installs the `launchcheck` command. |
| [`launchwatch`](https://github.com/brijraj-rana/launchwatch) | Keeps checking live websites from the menu bar. |
| [`smol`](https://github.com/brijraj-rana/smol) | An image compressor with a dial for an interface. Also installs the `smol` command. |
| [`notchload`](https://github.com/brijraj-rana/notchload) | A system load monitor under the MacBook notch. |
| [`notchshelf`](https://github.com/brijraj-rana/notchshelf) | A file shelf under the MacBook notch. |
| [`portpeek`](https://github.com/brijraj-rana/portpeek) | Lists listening localhost ports from a screen corner. |

All of them need macOS 14 or later and run on Apple Silicon and Intel.

## First launch

The apps are signed ad hoc and not notarized. Homebrew keeps the macOS quarantine flag on what it downloads, so the first launch is blocked: open the app once, then allow it under System Settings → Privacy & Security → Open Anyway.

## Updating

```bash
brew upgrade --cask
```

## For the maintainer

`scripts/update.py` rewrites every cask from each app's latest GitHub release (version and checksum). Run it after publishing a release, then commit.
