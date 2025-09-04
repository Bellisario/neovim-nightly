cask "neovim-nightly" do
  version "nightly-2b421d518faec9e1b0a6d1c46026d2f13f4fb73f"

  on_arm do
    sha256 "0da3b13b38c642cf1ca0f92c819b18070aad11b1dc4f98eb8d4af231d53b8d33"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "6a0c78e75d6ee1d08c931e00132c8ec8b400f4f45ba1af705dc2a4eb55ab39e5"
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
