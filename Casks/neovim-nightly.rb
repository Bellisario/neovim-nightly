cask "neovim-nightly" do
  version "nightly-a4ad469fb1f935aed6f84cfa9e663ab4f7ca1e02"

  on_arm do
    sha256 "65429eb0ec05e1282d7ae7b4d97948a7f3aca1abcb8b0f988a7b3cc8a0be0307"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "772f66d72c9aea57009b69a98a14b33232e6edc058c93c61bd69817600eacf9a"
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
