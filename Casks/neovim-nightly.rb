cask "neovim-nightly" do
  version "nightly-3f4ef487da80da73f4943d81fb8549c9de70f55f"

  on_arm do
    sha256 "83c7cff1986af931d86765e19b27f44233ae0787d67d46b35399323dccc19d2d"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "b7af1eeba43c0fc0b074ba78b56506aa945220a7f6134eb2b39563dd34a87d87"
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
