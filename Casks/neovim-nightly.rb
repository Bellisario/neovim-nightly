cask "neovim-nightly" do
  version "nightly-ad330e99d1feed6277fa1a10fb0b333eecf4d5b1"

  on_arm do
    sha256 "f8980d4d3397f76ad53e4e17cf9956c5827798a0d6cce60aa5e79442967284eb"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "6a8262fe4795ea03de8be3f8bf2fce63b1ba4532d7d9e66ade52573df3ba7235"
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
