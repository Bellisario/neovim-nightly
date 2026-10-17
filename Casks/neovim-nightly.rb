cask "neovim-nightly" do
  version "nightly-9b7ec59580fddf671f7bf922f66ef114a59a51ee"

  on_arm do
    sha256 "3382a2401670da6d7058138eeb4de2451b9c375ad39847a059c800258a4f69ca"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "d3eed1577854f9dee9cf8553f3205f18629c5f7a45f9af04557e82e2cdbb7818"
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
