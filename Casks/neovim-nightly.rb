cask "neovim-nightly" do
  version "nightly-a5aa62e37b82214a1d4d1e0a54d193b155fb340c"

  on_arm do
    sha256 "a542076c86dcb7e5cd3a4fcd830453d3a3ae792e0488991c0bbcbb6c83c6ae09"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "9155e9407c1b40c3a0f05d86bcdc9ad07024a8db1164908fc511ef6fc0d8b91e"
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
