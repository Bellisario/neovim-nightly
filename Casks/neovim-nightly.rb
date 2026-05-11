cask "neovim-nightly" do
  version "nightly-0e7d51a378173fdde0888dd9fd582aff0beb3d7e"

  on_arm do
    sha256 "74e457fd7f8e0a941bd61742245f3fe862d1f0b3523286ad7cb22cb8fbdf0493"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "a97893466da095fe46add0400f67b97bbf11d4f507a6329429d05a44609b7d5d"
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
