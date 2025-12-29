cask "neovim-nightly" do
  version "nightly-e916f0327728c78945e6353eeeeb88749b077c0b"

  on_arm do
    sha256 "8fa30e953d538670eb30ffdc03d503753354e9a4e4efe3e0d4e7fc2a14da4f58"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "d326267fa28b3207ec80da19ffd95a8ba3b45f6872ee7efba03a7c0b961d5d98"
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
