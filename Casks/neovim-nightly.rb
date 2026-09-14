cask "neovim-nightly" do
  version "nightly-e7e29d9b6d11919c35991e843ab1de8cc4e10328"

  on_arm do
    sha256 "265e854284e8d4d27c7064ddac5e61eea1c79f16bd64865090cce69772ccd0b5"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "eca381e7623818915fd54b71ffa2aed94de3df814c13c4d8515142f002d0afb6"
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
