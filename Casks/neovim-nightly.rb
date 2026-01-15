cask "neovim-nightly" do
  version "nightly-86c939ba91e97f0364bf5ba877a0fb4f45309c35"

  on_arm do
    sha256 "f06b5f5c3ad37d383f33f5fe12bb9c9ea61f5fcb2daac5fd0ea6e7f695287851"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "1ffa4975ed3a61840b97075868eb8fae71ba579a6b8bb4bb385ddf1d656e8339"
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
