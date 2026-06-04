cask "neovim-nightly" do
  version "nightly-10d0931d4412c09fcebea4af5b4809542f1f2a9b"

  on_arm do
    sha256 "7905dd4f5aedce0d4ef0a1d1b102fd0786d34297de56438e899eae7484b48e8a"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "3e768755e2f8a67707471381c495e7db7275f93b0541f057a7c3b8d9f6d696b5"
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
