cask "neovim-nightly" do
  version "nightly-16f7440cc7b59b7e5c79f593fedc117d2d16d7dd"

  on_arm do
    sha256 "7e1a54b6eaf02e210adf95e7819179331392a70357cb7c7e4d257319c2bdb6c5"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "dd1b7125367b11611199b24998453eb0faaba6560360d55b87b6c2a6494fb6cf"
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
