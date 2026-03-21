cask "neovim-nightly" do
  version "nightly-0655a359ae73348e7bba457ca4a1fae0450dcb98"

  on_arm do
    sha256 "6a2058e60a10be2dc70b97ca30a3e5d252abc8c6bc32923a7eff07d4fce596a0"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "e95ed19507e6032f0ecfdd09ca92e5919b186221588c596b4c48ae33536785f9"
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
