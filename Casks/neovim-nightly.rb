cask "neovim-nightly" do
  version "nightly-60cbdc7996ab053430e2c11bb9d7fa89702a9047"

  on_arm do
    sha256 "e2727410b0ac5fab0af82a8800a9320228eda25af3cdc503153420440cb6a0c6"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "146dd888cd63ff1fde017974089384175f1a0bfe1820f5a4d64376f0bd0d9043"
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
