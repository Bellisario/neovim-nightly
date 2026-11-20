cask "neovim-nightly" do
  version "nightly-2843068c7a9c78c206189c37b53cdb6f464e57ae"

  on_arm do
    sha256 "b43957e4bfa5bf8b50ce8d453b041e149bcb017f6430792d5f96d6c052d4e1e9"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "82a6b51a2ce385735e307f871fc2f1e388aa189ac64421fc8036d8ba7239280b"
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
