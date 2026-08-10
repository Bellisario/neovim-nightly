cask "neovim-nightly" do
  version "nightly-2450ae797c5adee90c267cf28baaab54eebf9796"

  on_arm do
    sha256 "ee68abcbca93e8b3f1d234cdea3ed8f6e79abc84a5227162dab165ee331f52fd"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "f314b95b6b175afa362f71d6743fa0bc8ed4a0546073a9b923d609aaa95e3c45"
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
