cask "neovim-nightly" do
  version "nightly-89b5a1a181538ee65b88a5b1412901e84f0eaa07"

  on_arm do
    sha256 "c9c3647979fcc6d96a4a5fa84cc0751927bce8d61290a41b0392b77176e64b8c"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "00547f8b61b6fa804d381e4c253b74da987d3b38933bc1d4096116a91fc65d7e"
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
