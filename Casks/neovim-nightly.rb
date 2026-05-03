cask "neovim-nightly" do
  version "nightly-14819d55fbca18ef70638cce38318fe6bc4b32dc"

  on_arm do
    sha256 "c0d4b7a666c5d0c01f11a36080f631d8c8e572f8aae8087eb55ef2348e0b9a06"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "9626b4bde1c0020bb23d90bf884f25a4f58a27ffb730283832e3f490f1b0ab7f"
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
