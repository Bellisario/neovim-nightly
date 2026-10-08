cask "neovim-nightly" do
  version "nightly-27ee55c09d088c88b6c5ab5e8e2c4eaf86d6df71"

  on_arm do
    sha256 "3d4056bff7f91410e39f8a6feb1780c89bb280a3074efe5a9909d540b14a7f75"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "f2031b97a5569e9b7bef48e9c4c159f7b91d4baba16ab2166084bb016689c1db"
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
