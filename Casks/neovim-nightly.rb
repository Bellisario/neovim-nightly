cask "neovim-nightly" do
  version "nightly-cf48741227a9aa77533d5adfd2379e7c16c71363"

  on_arm do
    sha256 "e6575ae9e31bfde5c5a2b9d5004e15f3b0135ceab01344080792353e3c9b9167"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "db339a1cf7a5fd201c2b4a80139c8a6c449795249fbfad46fd4e6798ecd99d41"
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
