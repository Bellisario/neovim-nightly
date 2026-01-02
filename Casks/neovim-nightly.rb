cask "neovim-nightly" do
  version "nightly-acc3554439e5a08be0707b1dea0c923c43a2091b"

  on_arm do
    sha256 "2a48f4a172a40bdf78f92db652b007f686893f2437f58a17ebf483a6e22150dd"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "97ce6006c1a22e9239c8b5f65ddbaeea760cb0bb234c28804d0b2bde691a2b5e"
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
