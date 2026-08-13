cask "neovim-nightly" do
  version "nightly-e8a1addb5a3b72e2518c35ecf13effa5b23ee411"

  on_arm do
    sha256 "bad1086e855491ea2cf1ea4f16246f4963ccd4d0a0365dff96d149d59561c894"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "aa7f4dcd9de3f3f7a1a5126bb1fcb1012bf438c0aeade099f6566a31dfe89bff"
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
