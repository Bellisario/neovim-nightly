cask "neovim-nightly" do
  version "nightly-dbe59b5457692ec6677cda2e3573e667b54f7722"

  on_arm do
    sha256 "62652742f0909e8f7728d38a4a7d1fe7c59e2001b76913989e09c3d29a6b4af9"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "9f1e38d9beaa83d65c39872f01449d7570d869016c5d63a8f63afea8d92756ba"
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
