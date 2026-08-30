cask "neovim-nightly" do
  version "nightly-82ea5a8aac40331579113b961b6cef88865ad5a9"

  on_arm do
    sha256 "8f3cac94eb86df1ffe5d05e6561b037efcb8518603286ec3f516420027b22a94"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "6b6fd1f1afcb9a5e5077aed1f939808cc1ae4ec6cd2601b72df5d63d307bc14f"
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
