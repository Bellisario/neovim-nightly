cask "neovim-nightly" do
  version "nightly-b3dfa86e02b0ce0f3ef9bc7b90dbbd790e7da31e"

  on_arm do
    sha256 "bd652a992609700699deb2cbe76904a3d405f0a3ca36c12bdb5fe8ee083a5359"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "da1f22b3b2e406fe7ba5ed85dcbcf057b2448ffbbe294abda0125e1786db6a50"
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
