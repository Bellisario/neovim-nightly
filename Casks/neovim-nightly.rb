cask "neovim-nightly" do
  version "nightly-147190d8e7dd53cb329230630f764020b15d9c21"

  on_arm do
    sha256 "3c369eee4beba6a37ecf2081713a5e45a3c6b79d5a9090bac3dfe720e238ec1d"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "46bede725b2f5a1f348ae4623c2c2d69732d856e9d72c2b934d9a47d0dd0b6bb"
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
