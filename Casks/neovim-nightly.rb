cask "neovim-nightly" do
  version "nightly-130ef73e39ee011c40af96624d0c8ef0fa426b09"

  on_arm do
    sha256 "1971e90d544bd6f3c8df8bd4283b1ba82a77eafb3f19a033043449383c139864"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "41b2c1cccc7c84f6666f39c5b7c6333587ef51543400a65e20a4b34c8df5e154"
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
