cask "neovim-nightly" do
  version "nightly-f2f87f5fc55fbb4c0307bd775d625515b2de8dea"

  on_arm do
    sha256 "6e215faec4fb0b21339cd6995b2e4f46c1ce051062a285e30250527f475c4581"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "672e78322abc42ab10a61460a8cd44ad650546b3460f25b50bdbcb9ded5b9a83"
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
