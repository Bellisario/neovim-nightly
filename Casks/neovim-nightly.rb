cask "neovim-nightly" do
  version "nightly-492b8c9e9c7699a7158db407dfc7c24579fedb1e"

  on_arm do
    sha256 "32f457478cede34aa9163c983fb405d6c3dfa03d217dc3cf5c370222d0872ca3"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "d9010872a7fe06ac5dea47758b0eedbf849348de64b2661a7c9dac62d2395906"
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
