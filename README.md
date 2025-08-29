# Homebrew Neovim Nightly

Automate the installation and update of nightly versions of Neovim.

## Usage

1. Unlink or uninstall existing neovim `brew unlink neovim`/`brew uninstall neovim`
2. Tap this repository `brew tap Bellisario/neovim-nightly`
3. Install neovim nightly `brew install neovim-nightly`
4. Run neovim using `nvim` in the command line

## Current limitations

The GitHub action waits ~1h after the neovim GitHub action build is triggered, only then it triggers a formula update.\
This is done to allow nvim to finish building and gives the team time to re-build a failed build.\
During that hour, Homebrew won't see the update.

Only macOS is currently supported.

## Contributing

We :heart: contributions!\
Feel free to open an [issue](https://github.com/Bellisario/neovim-nightly/issues) or a [pull request](https://github.com/Bellisario/neovim-nightly/pulls).

> If you don't know where to start, check out the [help wanted issues](https://github.com/Bellisario/neovim-nightly/labels/help%20wanted)!

## Credits

This repo is forked from [benjiwolff/homebrew-neovim-nightly](https://github.com/benjiwolff/homebrew-neovim-nightly).\
I adapted the original formula to have sha256 hashes with versioning (for auto-upgrades) and the GitHub action to update the formula automatically.
