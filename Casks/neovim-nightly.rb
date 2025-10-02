cask "neovim-nightly" do
  version "nightly-28ccebd138ac1bccb13f7515bb647ed550fa94c5"

  on_arm do
    sha256 "215fdb5975bb16bbb6084dead18e2ec0b0fa199abe731a8fbd5db11945b01ae8"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "9504632aa40fe0e70f794ce5ecdce9e729e0441c43b0fb70453201d14ddc726b"
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
