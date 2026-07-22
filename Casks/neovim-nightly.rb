cask "neovim-nightly" do
  version "nightly-a277c08d98e999ff6a59ec1bcd39d7de374c8579"

  on_arm do
    sha256 "97478fbb72026e4f395c238ff9fec8cdfb0957784b1d91855d775766da30e1ce"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "48f73ec973df5a86faa79ed1d709ccd110a49a080ed7f22acb9e33eb3922dc48"
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
