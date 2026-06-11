cask "neovim-nightly" do
  version "nightly-d72e91a0b672b5c13eb76440585d0d5d9a8a5e3d"

  on_arm do
    sha256 "bd3e3e97a53dac3637596d0c97777f9b557d6420246dedc3fc9d23432a627518"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "23efe40fe7a2eaff02a2fbdcecdf7aae5fc9369665fc38ececce9e3f6e068c65"
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
