cask "neovim-nightly" do
  version "nightly-d15936f6ef9b6d225b92d93369efaf2b1bb37474"

  on_arm do
    sha256 "e66bf55075798bf1354ea833c08ac31002c9b4df4f0f8c5b8d40c62554137f1f"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "0d15a40c196bd787ed154e6c1d0dd9a7172a47e5a711017c6bf7a0ef5df4e2e1"
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
