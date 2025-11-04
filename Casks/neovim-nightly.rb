cask "neovim-nightly" do
  version "nightly-b80d390765b0c987f86ecd257fa8c38cc1225797"

  on_arm do
    sha256 "a2f9bbf1339b6d7350e8251ea7b1bb9d577e31008f5e7982c8a8347c97b557ec"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "3e4dec7067b639d8181dbd4ec65b455fd6261d1eb0e29c6a66b128633e1a93d6"
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
