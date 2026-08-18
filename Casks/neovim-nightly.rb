cask "neovim-nightly" do
  version "nightly-82c751db4ee910dae9157ab1e29dfbeb2574e7f4"

  on_arm do
    sha256 "e0fdb598cbc405a1425e1e0adb9ce72d6411ff9b8493c82b161dcbe10d6bcdb3"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "0b5829a0d0147d27bf7e414d726b2bc971ce137f0d7b1b8da3cd4ad82cff8e95"
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
