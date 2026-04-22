cask "neovim-nightly" do
  version "nightly-56fb9ed82de5082f2ce2ff869fdca42225a0204e"

  on_arm do
    sha256 "d947268141a06843f05efe479283c453a3ce935b7ae5b4f4545d4d4ee04a8189"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "849deec90a73c21c1e89d8675766fe4c3e31d9c59a583b6e966459b2bbedebe9"
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
