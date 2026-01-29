cask "neovim-nightly" do
  version "nightly-4e4e1b09d30523076f3841a2c65d7ddcd9c481c4"

  on_arm do
    sha256 "04f9b985446ff5301fabb81721c5fe1d6db102192e9100c0e6040e9c1d96c785"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "0370b806fbb95fa12a05128bfa3bb9f1902131f409cba939e1d730d3eb3d78e2"
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
