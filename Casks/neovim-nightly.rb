cask "neovim-nightly" do
  version "nightly-1a02896e169b7e22c489dd5b7f60b570c496631e"

  on_arm do
    sha256 "ec0481d4f70e29b7f5fd50e39780e70686736d9850da1e9f495adf4234c5fb28"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "eff2634be81ee6e4ce3ba8d67a74806fd39e9d714b6bd46883f87c1645c6df50"
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
