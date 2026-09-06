cask "neovim-nightly" do
  version "nightly-050fa30632e3eb540b0fc9be9343580bdecea2f3"

  on_arm do
    sha256 "3bac9d842947340d5b39edd805104dd6e3f0f98aea1a4388b6d5cc7401af4b0b"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "bf54b09fbadf4c1abebbb45b2e395cbc19f818f7b80d902c795c8506aa9caef9"
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
