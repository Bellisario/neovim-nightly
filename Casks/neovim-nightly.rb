cask "neovim-nightly" do
  version "nightly-94c21c22dcf6b1afdb25a250c08bd858d481429b"

  on_arm do
    sha256 "2d1dfc9760107c49ded9b72b61cc5ecc6131376ce36c6f222ceba7865698d5ce"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "200ee6923778e24163969c3dffdbd4ee165063a26a3e18da07c13abbd6a533b8"
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
