cask "neovim-nightly" do
  version "nightly-28c294363f37d013af69e2779d734c132037f73f"

  on_arm do
    sha256 "5466e749dfa57a83a43f2fe031b6dd289649ca1ab47b5b5685bcbc78485cde84"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "9f15fe7a70363fbe0bb1baa32cb2c1920975b5c1156fcbe38d8ed2dbd9ada7f3"
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
