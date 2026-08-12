cask "neovim-nightly" do
  version "nightly-a0dc3f00675f738c6e69b71aa7c6e25a99bc4b6f"

  on_arm do
    sha256 "179d4976b4be04a790b58c5dc67e3afc6725f9659614649b9bfbb96b4fd7ba45"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "311f271e287648c5b328f3bc78d91dc8c0b835ae0327d4f21ab8c1db083bd4b9"
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
