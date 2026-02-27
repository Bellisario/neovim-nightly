cask "neovim-nightly" do
  version "nightly-18c5f06c9f6068b9a26a1ed4ab0f66b91db85cd9"

  on_arm do
    sha256 "4553ef8524540de88b8654d87add63c99f8f9e2b97565c2f2056806342302dcf"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "bf67ee418c0c35d441b8a21de68eba163af66d619a65f6fcd25d59329ba577e8"
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
