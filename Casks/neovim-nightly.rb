cask "neovim-nightly" do
  version "nightly-be5167e21cfbb5d566c09a67c1852d0e18c62c38"

  on_arm do
    sha256 "46725de4ff3ecf2c99d3ab75765f1a537aa130cc2e7efd1d7601eec1251d0530"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "ada9b6d3e443028a9b4ccbafe5e15555337c559c17b49402f7b88c61d3993f09"
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
