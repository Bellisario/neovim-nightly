cask "neovim-nightly" do
  version "nightly-f876fd906eb4433095262e14c02229981b40d4f4"

  on_arm do
    sha256 "2bb99b30fd7d6d86c6e2a2c445e55bf751ff8edeed2068be3206d30c70fbfb36"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "aeddc0fbd9b5095f4180f6bdc3b1d7e788be0a52aaa5e772800d1025e4a1e34d"
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
