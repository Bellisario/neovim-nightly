cask "neovim-nightly" do
  version "nightly-6b4ec2264e1d8ba027b85f3883d532c5068be92a"

  on_arm do
    sha256 "39f0b73b99341c25b85679de1afafc0444d15c50675f5b50247813ec9c6d1a38"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "373e4b54fa8ced2a894f8db835d66085abf43866c8cfd579382c0f8cd3156f61"
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
