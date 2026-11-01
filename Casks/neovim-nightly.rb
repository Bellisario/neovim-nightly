cask "neovim-nightly" do
  version "nightly-facba8d36b418c9aae032e049c0313cd6e09ce91"

  on_arm do
    sha256 "64b0bb48156f28a3ebf34cc1bc7fae1d3c0698a88baa62c9df620b1f630b4c7c"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "5477712a8cc2e96cb0683ce0549fc234c36bcd7ce7f5a88ad2946c1461006edc"
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
