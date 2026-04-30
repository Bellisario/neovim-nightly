cask "neovim-nightly" do
  version "nightly-1e06e9566262eab316a9d9b6a4a6f14f9f15fa01"

  on_arm do
    sha256 "a2310caf33832650074b3d14f86ff94730413e7d45cda8deac53259bfaa82471"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "74598256cf84eed5118d4a9dc02feb5d7c70333b9ab67678a34e58054fa3e4e1"
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
