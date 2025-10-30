cask "neovim-nightly" do
  version "nightly-69bddc089fb878c8bfb2d0ae35c783a3980aee6e"

  on_arm do
    sha256 "f5c68ba25d4256c0c5749fc3e81cb5b6b0eae2ba49d98407c1dc4d137f8c2e93"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "1d1b9ce7e6cf41b39c476b2bc4a0ad68d9b2fb8e2f3df6b5e1e7dc7b2b1e6bfe"
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
