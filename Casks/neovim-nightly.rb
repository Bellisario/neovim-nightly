cask "neovim-nightly" do
  version "nightly-1d22b05f8db21a7df4a2f3599fcbb4f2a4d7f893"

  on_arm do
    sha256 "e448b9f69e3f95994232db15a5500eb5957e2f4018e4802ba4da8fccec9cac82"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "aa1df13c0f0e2b77e026ecc8d7094eec28368bb42f19def80e6e16a9428a22db"
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
