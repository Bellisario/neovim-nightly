cask "neovim-nightly" do
  version "nightly-3b8c19ea460b4abb5b74f91e05a14c0fcf9cc6a6"

  on_arm do
    sha256 "08c5591a28e13c77125ba4f206688509a1bd71f1293afbca6ca952e8d08ebed2"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "64aae96f26f8b74b9b08f803af53721c48bf514d241b95d114cfa60fd25cccc5"
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
