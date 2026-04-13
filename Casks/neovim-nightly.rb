cask "neovim-nightly" do
  version "nightly-09d4eba92b96695de54067022cd7e42642dbb6bb"

  on_arm do
    sha256 "d5ec9d9a431f63d6a8f1275049ea97cbb1001220a1ffcb893e0bc381d20274aa"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "521821b8699a9b3c6b7aefd8a5bb53ee8ea08494291bacb20f3e358c579e5ea9"
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
