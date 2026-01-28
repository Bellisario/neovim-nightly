cask "neovim-nightly" do
  version "nightly-027b7d6bbb4f164b95f1588b250a02020d85b029"

  on_arm do
    sha256 "046fe2a7aadfee0b7574f82ca29566dfe1a0a19484d3b8a7321d3d36d5c0e48c"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "ee3a46bb28b04691fe12e716f72c45e0d22e15fef7300fef4ac6c60e745f6cbf"
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
