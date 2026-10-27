cask "neovim-nightly" do
  version "nightly-3ee26cf91f28cfac9d0f862849118c93643ea2ba"

  on_arm do
    sha256 "15067e55d07d83f1340f5ce278dbc5234c703485c025375ac8672766ddd4e1d6"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "3bdba4053a27b5acdb29e0d18b95070e71d2466b7118a3da0d38cff1f71405be"
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
