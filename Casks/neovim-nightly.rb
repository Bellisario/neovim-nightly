cask "neovim-nightly" do
  version "nightly-1be37c245f27e2fa74347e002c5fd1c59f14422a"

  on_arm do
    sha256 "ece98978022674a5d48fba83f32a3a3d6bafd7fc767bdd1898ec78ff1bd1529f"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "9814ba2d76a3f8bce7784e6601a9492c66f9cc10f5768bffaa2acb3b411b6081"
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
