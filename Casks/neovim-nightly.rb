cask "neovim-nightly" do
  version "nightly-62dd74d472f694d1386c54afc1c65e2aff4f4396"

  on_arm do
    sha256 "c4b05742b1c6d101996051febf0398624b66965cb0a6b173567fedf96ec96c1a"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "8a86b97f6afe08b6bddba6a0fabfe4432a164000a3df31754e755d0f8850cc58"
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
