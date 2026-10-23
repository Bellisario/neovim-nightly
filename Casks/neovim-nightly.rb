cask "neovim-nightly" do
  version "nightly-d714648b8e7c476b7b5c1f661aa192b179bfc1d3"

  on_arm do
    sha256 "e2b50ccc3e5a1640b5b8536b14519b347a8afdca5d835d9270915ca4b89352a7"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "90e2a703c5a6b7d11ef04203af2c5d1eb3e7542cfa19464e59204f57bf6473f2"
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
