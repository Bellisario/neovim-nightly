cask "neovim-nightly" do
  version "nightly-af5ac171bde3ae7f961a23e9464309cee7ef9c13"

  on_arm do
    sha256 "4eb5387002bdcef876488d654a9c9480f158e2b0eb215972aeeab5652c64d0dd"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "aceee550fa1621ba2794b2a73b89c18781202ed66fa531c114e7130b9f6b42a8"
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
