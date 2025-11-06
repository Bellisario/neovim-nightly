cask "neovim-nightly" do
  version "nightly-16c8152229c6d11ed3647ba01c4bcd70d11b7f11"

  on_arm do
    sha256 "04463a7cdd174c7af98d0457d84fa60ce68d330849cd915d0c31b3eba541000a"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "3dfa50746f6f1b43de46a2fb8ffda51bc63db8483f4575f7efbf1c4d6d2b611f"
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
