cask "neovim-nightly" do
  version "nightly-64eb2731da2416dea1f90585cee2733075e2ec86"

  on_arm do
    sha256 "c2d555c98c7fd45dc06d556b613ac7003136941eb98d660c01406cfe21b79c11"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "ff4d5e5eefdc6a06892887a585a05c0c1407ba05570be0b8d254b9d7f0ea8a8b"
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
