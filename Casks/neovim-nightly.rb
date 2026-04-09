cask "neovim-nightly" do
  version "nightly-9c5fba5df0b60cd25ac2c180a7d82fca47a105e6"

  on_arm do
    sha256 "ea2c34f364c76d8b864d472b88d1bcddbb34e99d579e0bec3de0fab4f9017cbd"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "ad8f8465448e9db29b60ead15d9c2936b11a9d0e26ec10504793cb5cbe2a4f31"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-x86_64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-x86_64/bin/nvim"
  end

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  caveats <<~EOS
    This cask conflicts with the neovim formula. You should uninstall it with
    `brew uninstall neovim` before installing this cask.
  EOS

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end
