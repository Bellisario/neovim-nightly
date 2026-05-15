cask "neovim-nightly" do
  version "nightly-45e63ee3a85a18ab04e8ee8c23c7239ec141072a"

  on_arm do
    sha256 "3f7009d0e8276e88758fed1fdff1dfb7942eeec5b8841a1bfaf48edcf4682e48"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "e8def182cdbadeb23ae9ec8dff7ebc9ea60aa912f68ffb483168524419f26c28"
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
