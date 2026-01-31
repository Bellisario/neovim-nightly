cask "neovim-nightly" do
  version "nightly-1e6c4ea896b784754cb0ba18ea510a9c407ab54c"

  on_arm do
    sha256 "1edd0167d1ffb593f6cde8f02f69f44ec4b38d34b4b07e83a5ae29bd3c1ba1fc"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "5804c0f3b657220d53c60668282dd018ec4dad5e9d190816bcda4fcfe939aa22"
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
