cask "neovim-nightly" do
  version "nightly-d039f19af54e73e1f076c29f1cb412c14612da07"

  on_arm do
    sha256 "1f0a8673ef6ffeae0091e5c281d37ea14cf4af8aff8ce5cf1b56f662852da41c"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "caa2f89b9de2584e927faec9357ed335fedac8f3d4a6ba5a68e82c3ed152c60b"
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
