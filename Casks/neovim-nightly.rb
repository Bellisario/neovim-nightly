cask "neovim-nightly" do
  version "nightly-f1c82be1a1af3a0513f0562dd2d9024304aef27d"

  on_arm do
    sha256 "08de5effbd2e3dca71671b33054789a5858d7a9c8ed4cf3dda2c4690f7640a89"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "e4535a3a831268c4b271eb67ea1c212d76140f428e822ca370b1154f462f9fe3"
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
