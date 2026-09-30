cask "neovim-nightly" do
  version "nightly-d5e7c7e55ce090bb186edac909262a62920b3fa1"

  on_arm do
    sha256 "fa994f670b6464e545b5573e1ae2ef2054021bd3ebe893d907152d3d966daa2b"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "9ce430ce455a75f33de2e657a3f82c3a386e90f496ae3dd75745ec6e1b8ecaae"
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
