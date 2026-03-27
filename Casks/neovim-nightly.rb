cask "neovim-nightly" do
  version "nightly-925e9e87222cba0c48d2a9184fa3e5fcad65d4ba"

  on_arm do
    sha256 "f9d4bd911a7f915ece4db1395182aa791b08ef2fc8e19f20fb856ed6bc730425"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "5853fbeed8149f64956e39f9106042a18b93eccf63ca43cd0a9ef8ad45039c9b"
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
