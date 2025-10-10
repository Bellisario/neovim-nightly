cask "neovim-nightly" do
  version "nightly-56713ef8724b7778e41fc3cfa46bb6e04c661fa6"

  on_arm do
    sha256 "c8dc585f5d4a0d1c7d7f8eb3150d16b7cb3be263fcb169eca8a7514b4b352a2d"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "88ee43df499281f5a588b80c7c76a45dc6065d07fcee72f0f2a589ca83cf04ac"
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
