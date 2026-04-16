cask "neovim-nightly" do
  version "nightly-0e07b2a1e271f01f3458185876f8712d97f6cf38"

  on_arm do
    sha256 "c97978f25e92e8ff931d71da0bde81c3bfea1c2805184ae5bf530228c7ccac0b"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "cbfffb61f12df0c498f0c2ede9ddf74ebc3632f243bf7f459a2028c3efd9c6fc"
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
