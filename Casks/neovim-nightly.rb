cask "neovim-nightly" do
  version "nightly-72ac9ac9a1085d6f9bba64e49dd5afd500199aef"

  on_arm do
    sha256 "3a327d6da6f1ab5fc171a32b7e0f67ecead675a638719281feeef051365a82fc"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "ff49df7c4e1cb71ee0ea1e35a7991542eec794134cafadc12e022e9e85da25d1"
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
