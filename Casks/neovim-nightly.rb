cask "neovim-nightly" do
  version "nightly-444e1ffe3e9c093d764eeda4d469abe46c6c1565"

  on_arm do
    sha256 "facb0047a000cf8193f297d5c3f8c0befc2c6e1c8c9154a16a2d3dfb89a4a92e"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "feef7cc80f0e996ad5d617f838bae841852c867b58ed66eafa7929daa4625e94"
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
