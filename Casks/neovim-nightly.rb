cask "neovim-nightly" do
  version "nightly-39410ef42ba3bd5c4db5fa3f944b5abca935d3dc"

  on_arm do
    sha256 "1de2d28b3ef18f4cff6da3887728c60c26f1a1b7f88c7efee11c969625a017eb"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "2faefda5e3a93a7530ae0ffc6a6cdf899bb1cf90e2018d4dc5258b0a7e80e2a0"
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
