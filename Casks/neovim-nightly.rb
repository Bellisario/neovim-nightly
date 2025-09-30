cask "neovim-nightly" do
  version "nightly-35fc4fda999f06ad1cd0d6cd07e06b21b2bd3dc6"

  on_arm do
    sha256 "5471fb37d0403cc0507c64a2c0f29bdf01b3ed08c2bdd9a8ed78cafb574f4ef1"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "211d472ace05c9c47eccacb761f907da9b68ac1001f22814121ba960b46b807b"
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
