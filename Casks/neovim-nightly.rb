cask "neovim-nightly" do
  version "nightly-d017f3c9a0b745e0c57feb8c92dcc852948f7301"

  on_arm do
    sha256 "0dd66d170fcf4dc8ebf379c652282079348575da0300d87734acc1ddc867a423"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "5a9e8407db48a75b44cc7dd6835a7c9641191f87a3bb716e3ed0229f9b906a83"
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
