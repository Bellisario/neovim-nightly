cask "neovim-nightly" do
  version "nightly-c1dcb8dac2f919b274ea3ea1f5825711ab57ef52"

  on_arm do
    sha256 "6776fdec72b903d4e9572785cf9b0e0457c2d14d17883fa23f86c2f4f49cb6fb"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "fbb80519900f3c565807e3874ec261b1bb59113b88f2b2aaea5745a674266775"
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
