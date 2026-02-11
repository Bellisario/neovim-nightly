cask "neovim-nightly" do
  version "nightly-886efcb8535e77c685f73d62fa9138f59121c241"

  on_arm do
    sha256 "f1125ae14bcd1cd587f418c881c52a426ffe905b958b0743ca9f1dcbe30932bb"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "e176ee9dc459f9e611180b9e0a5d0911c81357deab4b1173ec235a2f99ec049f"
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
