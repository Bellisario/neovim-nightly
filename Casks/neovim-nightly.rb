cask "neovim-nightly" do
  version "nightly-e77714b475f51a4d7f22926198fac0b3cde32bc5"

  on_arm do
    sha256 "1caabc20234693799f0eff1521d7da9f9ec8a514c687eda1cfbefa808d0fae6e"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "ac9dde284933799811dd93fb4953dc29a0e58aba47cd5e153ff823aa5f57ba03"
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
