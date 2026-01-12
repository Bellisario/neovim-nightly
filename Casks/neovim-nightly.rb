cask "neovim-nightly" do
  version "nightly-7a6e8d4430764d34b189a038ae41c7c31297cc20"

  on_arm do
    sha256 "c44681efb96cfa94942fc94981aabc234fbb72b1ac84624f9f1cbbf2ab1b3472"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "d2d3061a9eaef521a754dbb036a077b981b7fab6f5c49605b45f7f71e49b4f9c"
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
