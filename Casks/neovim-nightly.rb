cask "neovim-nightly" do
  version "nightly-561857c4a88072407c79e9707e6f2e81bce097d2"

  on_arm do
    sha256 "475d8a6cf7abd0b435a3073a28fbbdcf5df94085b02945d4170e9bfe9a9d660d"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "bf60f800f1c2dcb50e233cae4acc32e949228e71d0b10194251340f03c3790a5"
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
