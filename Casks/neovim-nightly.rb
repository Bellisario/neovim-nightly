cask "neovim-nightly" do
  version "nightly-30d2de4d9f8b8e0dcb9aefc25087085437a337e8"

  on_arm do
    sha256 "a3d1f2de28a1879229268746f0467ca7ce1b5478c6c14de32fad9a4dca85d1bb"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "b7abf3246a34007c34e54b440ed26419e75450281f094e6f9800f9f447ec91e0"
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
