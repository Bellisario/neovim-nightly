cask "neovim-nightly" do
  version "nightly-a5103c08538e47dec8c4aec24a1d377ab7463f31"

  on_arm do
    sha256 "cf509a4cae3147e6f15d4f54f8116b5e66b67b87bb6982ab67afbcd6ea77cb36"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "4f60d7dc6f9e105254b85b8bc56a75488d17f2c070c4593d3e931543697c7b0d"
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
