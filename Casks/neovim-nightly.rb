cask "neovim-nightly" do
  version "nightly-7e09fedf43fa191dcebbe131928aa8df3930888d"

  on_arm do
    sha256 "2b71776454f15fdc65648a7f785381d39418c2f204e607fe1c0eda5298c5c3e2"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "05672f95d4b60c4f3fc4d662f03f6331ffa328b35985a74dd2895ccb06f5f3fa"
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
