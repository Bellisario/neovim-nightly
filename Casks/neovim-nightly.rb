cask "neovim-nightly" do
  version "nightly-17bcf86caba7fab540e0e337484253e0edd28a16"

  on_arm do
    sha256 "2e63a4477fa74a551d1bde8e9b033f0bcbb243d8e144b5cbf6d465a1401bd37b"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "e883745ce57f09aa3eeecbc939af51fc049deece034c78bfbd41d0119f67cd76"
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
