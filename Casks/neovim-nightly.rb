cask "neovim-nightly" do
  version "nightly-40a42affa5c3ecdb1d8133850ebf4e043cd2f14b"

  on_arm do
    sha256 "73cc294993da4ffa011082af8fce6ea950aae7f7404270c1e142e2bc57f21811"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "b47e191d82f186a4da7c1dfd4a77af16cebc6dcd476c9872033067d26c30170d"
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
