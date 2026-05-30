cask "neovim-nightly" do
  version "nightly-286860fde594a7c0f3b64f0fcaebcb0aab28aaf3"

  on_arm do
    sha256 "25c26d9fcd25ffe42411509ff3c0012fe8c47d7cd471d1f90614b57160316eb6"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "bbaa8dd6420108712960cccbaebf1713c6154a964e47997f2573f37b4df270d7"
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
