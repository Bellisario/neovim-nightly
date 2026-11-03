cask "neovim-nightly" do
  version "nightly-6332ba64fe56f922c5cd2d93e4cfa23673966b6d"

  on_arm do
    sha256 "517a4a8942eaad0253df05ecf660d4ac56c3aecf15e5fb2d1a9ee6e378862fdb"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "0c0a268a784c316c9d7ffe5ee0499e74568bdfcd444bf34ecfe89b8716baca07"
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
