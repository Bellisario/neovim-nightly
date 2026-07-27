cask "neovim-nightly" do
  version "nightly-7f8175dc48f9fbceb2d89f0646f03e2e18f9debb"

  on_arm do
    sha256 "c99041d425cd40cbd6a2baf70329890c5a9ca8a39e5f6a41b5084bf5d6c6e8eb"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "42f0bcfe49e58515c10f0bdfd2524ed8b760a0d41edfd3695322c12dcf5e3a6d"
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
