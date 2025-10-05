cask "neovim-nightly" do
  version "nightly-b938638d2d069f71a3e80e3589dc2050396f0243"

  on_arm do
    sha256 "70c8fd0ce67309b7e901df4f3e1f1087e752c40a4aca50dbf5fb1e7f5512af8b"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "ca5def4f1e4a02dc5ab5c91f99ecdecf85c43c0940ebb16a020395e6ff77564d"
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
