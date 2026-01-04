cask "neovim-nightly" do
  version "nightly-715015d3b231a5d640f9bb109caf4d817c7f2bd6"

  on_arm do
    sha256 "37adb9fdbafa4b98c54a22b23c8598db78fb169b76ae79cdd6432e449d34d0c7"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "6d88e9e7b48d432b726196ec8538204d70030782983fd81edfa2ef5c25b5c5e3"
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
