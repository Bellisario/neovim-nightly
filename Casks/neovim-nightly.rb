cask "neovim-nightly" do
  version "nightly-4c2b7ddcddce5322226a05aa03c9d1a0ec5aa6b2"

  on_arm do
    sha256 "416bf2b2e73a8e7ac2330e0764d44cfb5717e52b5b34b01f8ea94b6809613fa9"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "d3bc21e921b7a2ac60f031cbe7657158bef9a618f216c747d67ca7ff5876f13d"
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
