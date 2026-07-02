cask "neovim-nightly" do
  version "nightly-e4e9eebbae9c44255b5f5b09a7d79d379d3841cc"

  on_arm do
    sha256 "585bf7e7752690d6cce3c0f507b63e8e92da2c0914fc99674460afa0c712b995"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "1a4b619743d8fb19554421734cc372cbbd1e6f1b1498970555bc4e11c10cb4b5"
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
