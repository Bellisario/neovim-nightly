cask "neovim-nightly" do
  version "nightly-48864161cd75ae4b58f7af94d6c9add0ba876107"

  on_arm do
    sha256 "d46b8174bcc9387be54d20180ad666070d6225059ce54e43b9d4efe5a29fad57"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "6ebb3b33bb62d97adee812d2c90ce7e5afd6112dad1420af0ec5e159115b0db2"
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
