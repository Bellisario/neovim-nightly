cask "neovim-nightly" do
  version "nightly-f4e4799f2707a41a882fa85c2f1a276d69f08d56"

  on_arm do
    sha256 "0773c35b62c6a9cdc25051e40780fbd5ebc574075c0da4f15d3d9e849cea4e10"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "c23fde2b71d5cfb19f824d4101058b706a3a96921f548ec56b2c3fb924fda737"
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
