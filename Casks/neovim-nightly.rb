cask "neovim-nightly" do
  version "nightly-a59c8a9c76ce790d5f131ff79ab95e2c7171c5bf"

  on_arm do
    sha256 "67ddfe18ae9eb542e6a04e9077763e932a0fdb459dda58e8e06806f4a9676a95"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "3cdf696f9a76f234608e410bbc4727df49670f8934533f16f9c571ad73bc9d06"
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
