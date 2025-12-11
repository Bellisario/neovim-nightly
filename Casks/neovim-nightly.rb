cask "neovim-nightly" do
  version "nightly-3a70fc8cb8fedf78b5e0d7c606d99967faad70ab"

  on_arm do
    sha256 "1014587be303a344c3c675f11fe07deeed641a668cc13aa6b3d3e5881ba6ec3c"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "57268e36127ddb33edcbae2f4f8b09cc608e3ea84a0453a9685c66070774651d"
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
