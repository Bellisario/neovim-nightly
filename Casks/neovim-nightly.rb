cask "neovim-nightly" do
  version "nightly-2015f19f1b800fe6a6e62e3c5011ed090e61ef26"

  on_arm do
    sha256 "287e30d15bc13266e5b2a2aa72147e4cbf28e25f667ab1a9b5379c63cd5b734a"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "42be54692d667440e4cda1373013db5b7da1fddd69c477b0583cf25b6882f548"
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
