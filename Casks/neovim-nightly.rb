cask "neovim-nightly" do
  version "nightly-196df35cca7df2f499ce6f1352184bf7034801c7"

  on_arm do
    sha256 "4d99c2c8ac596dbef2aa872605c10a253893e10b34779fc4718d3f57226c6ecb"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "7dc16592887e0eca7b1c3c855d129a6f242880ed1e2e4b6079f03771ea9c50a3"
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
