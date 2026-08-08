cask "neovim-nightly" do
  version "nightly-a08607b8d6f95949a0b2b9bdec1f4a06735ecb29"

  on_arm do
    sha256 "4de5db1ec8d697a932cb2c65a614d7469f999a1cd2f336258c7429404ad5d8e2"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "eae6ae5846672a8c6fa355d454ca1423900e2c4541480c424feeb5a9847b19ad"
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
