cask "neovim-nightly" do
  version "nightly-df62cb3e6944321b6b610236092a5f86238fd428"

  on_arm do
    sha256 "8a29be6ebedbaa592d3200854945d9391f6381a5e618a45d09d4ec60492d76fb"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "20c0aad9fcda122d7e2f9657a058fbd222c7fd092cffb96d670c0dc2c7e5666f"
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
